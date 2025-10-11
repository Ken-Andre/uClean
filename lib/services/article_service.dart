import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/article.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Service de gestion des articles.
/// Gère le chargement des articles depuis les assets, la progression de lecture de l'utilisateur,
/// et fournit des méthodes pour accéder aux données de manière performante.
class ArticleService {
  // --- Constantes ---
  static const String _articlesIndexPath = 'assets/articles/articles.json';
  static const String _localProgressFile = 'articles_progress.json';
  static const _sevenDays = Duration(days: 7);
  static const _thirtyDays = Duration(days: 30);

  // --- Cache interne ---
  /// Cache en mémoire pour la liste des articles afin d'éviter les lectures de fichiers répétées.
  List<Article>? _cachedArticles;

  // --- Méthodes Publiques ---

  /// Récupère tous les articles depuis l'index, en utilisant un cache pour la performance.
  /// Le paramètre [forceRefresh] peut être utilisé pour forcer le rechargement depuis le fichier.
  Future<List<Article>> getArticles({bool forceRefresh = false}) async {
    if (_cachedArticles != null && !forceRefresh) {
      return _cachedArticles!;
    }

    try {
      final String jsonString = await rootBundle.loadString(_articlesIndexPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> articlesData = jsonData['articles'] as List<dynamic>;

      final Map<String, dynamic> localProgress = await _getLocalProgress();

      final List<Article> articles = articlesData.map((articleData) {
        final article = Article.fromJson(articleData);
        final String articleId = article.id;

        if (localProgress.containsKey(articleId)) {
          final progressData = localProgress[articleId];
          return article.copyWith(
            isRead: progressData['is_read'] as bool? ?? false,
            lastReadAt: progressData['last_read_at'] != null
                ? DateTime.parse(progressData['last_read_at'] as String)
                : null,
          );
        }
        return article;
      }).toList();

      _cachedArticles = articles; // Met à jour le cache
      return articles;
    } catch (e, stackTrace) {
      developer.log(
        'Erreur critique lors du chargement des articles',
        name: 'ArticleService.getArticles',
        error: e,
        stackTrace: stackTrace,
      );
      // Relance une exception pour que la couche UI puisse afficher un message.
      throw Exception('Impossible de charger les articles.');
    }
  }

  /// Récupère le contenu Markdown d'un article spécifique.
  Future<String?> getArticleContent(String contentPath) async {
    try {
      return await rootBundle.loadString(contentPath);
    } catch (e, stackTrace) {
      developer.log(
        'Erreur lors du chargement du contenu de l\'article: $contentPath',
        name: 'ArticleService.getArticleContent',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  /// Marque un article comme lu, met à jour le fichier de progression et le cache interne.
  Future<void> markArticleAsRead(String articleId) async {
    final now = DateTime.now();
    final newProgressData = {
      articleId: {
        'is_read': true,
        'last_read_at': now.toIso8601String(),
      }
    };

    await _saveLocalProgress(newProgressData);

    // Met à jour le cache interne pour un feedback UI immédiat sans rechargement.
    if (_cachedArticles != null) {
      final articleIndex =
          _cachedArticles!.indexWhere((a) => a.id == articleId);
      if (articleIndex != -1) {
        _cachedArticles![articleIndex] =
            _cachedArticles![articleIndex].copyWith(
          isRead: true,
          lastReadAt: now,
        );
      }
    }
  }

  /// Récupère les articles publiés dans les 7 derniers jours.
  Future<List<Article>> getRecentArticles() async {
    final articles = await getArticles();
    final weekAgo = DateTime.now().subtract(_sevenDays);
    return articles.where((article) => article.date.isAfter(weekAgo)).toList();
  }

  /// Récupère les articles lus par l'utilisateur dans les 30 derniers jours, triés par date de lecture.
  Future<List<Article>> getRecentlyReadArticles() async {
    final articles = await getArticles();
    final thirtyDaysAgo = DateTime.now().subtract(_thirtyDays);

    return articles
        .where((article) =>
            article.isRead &&
            article.lastReadAt != null &&
            article.lastReadAt!.isAfter(thirtyDaysAgo))
        .toList()
      ..sort((a, b) => b.lastReadAt!.compareTo(a.lastReadAt!));
  }

  /// Calcule les points gagnés pour les articles lus durant les 7 derniers jours.
  Future<int> calculateReadingPoints() async {
    final articlesLusRecemment = await getRecentlyReadArticles();
    final weekAgo = DateTime.now().subtract(_sevenDays);

    final weeklyArticles = articlesLusRecemment
        .where((article) => article.lastReadAt!.isAfter(weekAgo));

    int totalPoints = 0;
    for (final article in weeklyArticles) {
      totalPoints += article.points ?? 0;
    }
    return totalPoints;
    weeklyArticles.fold(0, (sum, article) => sum + (article.points ?? 0));
  }

  // --- Méthodes Privées pour la gestion de fichiers ---

  /// Retourne le fichier de progression local avec gestion des plateformes.
  Future<File?> _getLocalProgressFile() async {
    if (kIsWeb) {
      // Sur le web, retourner null car nous utiliserons SharedPreferences
      return null;
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      return File('${directory.path}/$_localProgressFile');
    } catch (e) {
      developer.log(
        'Erreur lors de l\'accès au répertoire des documents: $e',
        name: 'ArticleService._getLocalProgressFile',
      );
      return null;
    }
  }

  /// Récupère la progression locale depuis le stockage de l'appareil.
  Future<Map<String, dynamic>> _getLocalProgress() async {
    if (kIsWeb) {
      // Sur le web, utiliser SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        final String? content = prefs.getString(_localProgressFile);
        if (content != null && content.isNotEmpty) {
          return json.decode(content) as Map<String, dynamic>;
        }
      } catch (e, stackTrace) {
        developer.log(
          'Erreur lors de la lecture de la progression locale (web).',
          name: 'ArticleService._getLocalProgress',
          error: e,
          stackTrace: stackTrace,
        );
      }
      return {};
    }

    try {
      final file = await _getLocalProgressFile();
      if (file != null && await file.exists()) {
        final String content = await file.readAsString();
        if (content.isNotEmpty) {
          return json.decode(content) as Map<String, dynamic>;
        }
      }
    } catch (e, stackTrace) {
      developer.log(
        'Erreur lors de la lecture de la progression locale.',
        name: 'ArticleService._getLocalProgress',
        error: e,
        stackTrace: stackTrace,
      );
    }
    return {};
  }

  /// Sauvegarde la progression locale en fusionnant les nouvelles données avec les anciennes.
  Future<void> _saveLocalProgress(Map<String, dynamic> newProgress) async {
    if (kIsWeb) {
      // Sur le web, utiliser SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        final existingProgress = await _getLocalProgress();
        existingProgress.addAll(newProgress);
        await prefs.setString(_localProgressFile, json.encode(existingProgress));
      } catch (e, stackTrace) {
        developer.log(
          'Erreur lors de la sauvegarde de la progression locale (web)',
          name: 'ArticleService._saveLocalProgress',
          error: e,
          stackTrace: stackTrace,
        );
        throw Exception('Impossible de sauvegarder la progression.');
      }
      return;
    }

    try {
      final file = await _getLocalProgressFile();
      if (file == null) {
        throw Exception('Impossible d\'accéder au stockage local.');
      }

      final existingProgress = await _getLocalProgress();
      existingProgress.addAll(newProgress);
      await file.writeAsString(json.encode(existingProgress));
    } catch (e, stackTrace) {
      developer.log(
        'Erreur lors de la sauvegarde de la progression locale',
        name: 'ArticleService._saveLocalProgress',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Impossible de sauvegarder la progression.');
    }
  }
}
