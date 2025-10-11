import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Configuration des points pour l'application
class PointsConfig {
  final Map<String, int> articlePoints;
  final Map<String, int> gamificationEvents;
  final Map<String, double> pointMultipliers;

  const PointsConfig({
    required this.articlePoints,
    required this.gamificationEvents,
    required this.pointMultipliers,
  });

  /// Configuration par défaut
  factory PointsConfig.defaultConfig() {
    return PointsConfig(
      articlePoints: {
        'default': 5,
        'Environment': 5,
        'Education': 4,
        'Transportation': 5,
        'Strategy': 6,
      },
      gamificationEvents: {
        'article_read': 5,
        'trip_recorded': 2,
        'trip_classified': 3,
        'weekly_streak': 10,
        'monthly_consistency': 15,
        'daily_goal': 5,
      },
      pointMultipliers: {
        'streak_bonus': 1.5,
        'classification_accuracy': 1.2,
        'first_time': 1.3,
      },
    );
  }

  /// Crée une configuration depuis JSON
  factory PointsConfig.fromJson(Map<String, dynamic> json) {
    return PointsConfig(
      articlePoints: Map<String, int>.from(json['article_points'] ?? {}),
      gamificationEvents: Map<String, int>.from(json['gamification_events'] ?? {}),
      pointMultipliers: Map<String, double>.from(json['point_multipliers'] ?? {}),
    );
  }

  /// Convertit en JSON
  Map<String, dynamic> toJson() {
    return {
      'article_points': articlePoints,
      'gamification_events': gamificationEvents,
      'point_multipliers': pointMultipliers,
    };
  }

  /// Calcule les points pour un article selon sa catégorie
  int getPointsForArticle(String category) {
    return articlePoints[category] ?? articlePoints['default'] ?? 5;
  }

  /// Calcule les points pour un événement de gamification
  int getPointsForEvent(String event) {
    return gamificationEvents[event] ?? 0;
  }

  /// Calcule les points avec multiplicateur
  int calculatePointsWithMultiplier(String event, {double? multiplier}) {
    final basePoints = getPointsForEvent(event);
    final eventMultiplier = multiplier ?? pointMultipliers[event] ?? 1.0;
    return (basePoints * eventMultiplier).round();
  }
}

/// Service de gestion de la configuration des points
class PointsConfigService {
  static const String _configPath = 'assets/config/points_config.json';
  static PointsConfig? _currentConfig;

  /// Récupère la configuration actuelle
  static PointsConfig get currentConfig {
    _currentConfig ??= PointsConfig.defaultConfig();
    return _currentConfig!;
  }

  /// Définit une nouvelle configuration
  static void setConfig(PointsConfig config) {
    _currentConfig = config;
  }

  /// Charge la configuration depuis le fichier assets
  static Future<void> loadConfig() async {
    try {
      final String jsonString = await rootBundle.loadString(_configPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      _currentConfig = PointsConfig.fromJson(jsonData);
      print('✅ Configuration des points chargée depuis $_configPath');
    } catch (e) {
      print('⚠️ Erreur lors du chargement de la configuration des points: $e');
      print('📋 Utilisation de la configuration par défaut');
      _currentConfig = PointsConfig.defaultConfig();
    }
  }

  /// Met à jour la configuration des points d'articles
  static void updateArticlePoints(Map<String, int> newPoints) {
    final current = currentConfig;
    final updatedConfig = PointsConfig(
      articlePoints: {...current.articlePoints, ...newPoints},
      gamificationEvents: current.gamificationEvents,
      pointMultipliers: current.pointMultipliers,
    );
    setConfig(updatedConfig);
  }

  /// Met à jour la configuration des événements de gamification
  static void updateGamificationEvents(Map<String, int> newEvents) {
    final current = currentConfig;
    final updatedConfig = PointsConfig(
      articlePoints: current.articlePoints,
      gamificationEvents: {...current.gamificationEvents, ...newEvents},
      pointMultipliers: current.pointMultipliers,
    );
    setConfig(updatedConfig);
  }

  /// Met à jour les multiplicateurs
  static void updatePointMultipliers(Map<String, double> newMultipliers) {
    final current = currentConfig;
    final updatedConfig = PointsConfig(
      articlePoints: current.articlePoints,
      gamificationEvents: current.gamificationEvents,
      pointMultipliers: {...current.pointMultipliers, ...newMultipliers},
    );
    setConfig(updatedConfig);
  }

  /// Exporte la configuration actuelle
  static String exportConfig() {
    return json.encode(currentConfig.toJson());
  }

  /// Importe une configuration depuis JSON
  static bool importConfig(String configJson) {
    try {
      final Map<String, dynamic> jsonData = json.decode(configJson);
      final config = PointsConfig.fromJson(jsonData);
      setConfig(config);
      return true;
    } catch (e) {
      print('❌ Erreur lors de l\'import de la configuration des points: $e');
      return false;
    }
  }
}

/// Singleton global
final pointsConfigService = PointsConfigService();
