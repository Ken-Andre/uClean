import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../services/points_config_service.dart';

/// Modèle représentant un article
class Article {
  final String id;
  final String title;
  final String imagePath;
  final DateTime date;
  final String category;
  final int points;
  final String contentPath;
  final String readingTime;
  final bool isRead;
  final DateTime? lastReadAt;

  const Article({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.category,
    required this.points,
    required this.contentPath,
    required this.readingTime,
    this.isRead = false,
    this.lastReadAt,
  });

  /// Récupère les points effectifs pour cet article (peut être différent de la valeur stockée)
  int getEffectivePoints() {
    return PointsConfigService.currentConfig.getPointsForArticle(category);
  }

  /// Factory pour créer depuis JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String,
      title: json['title'] as String,
      imagePath: json['image_path'] as String,
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
      points: json['points'] as int,
      contentPath: json['content_path'] as String,
      readingTime: json['reading_time'] as String,
      isRead: json['is_read'] as bool? ?? false,
      lastReadAt: json['last_read_at'] != null
          ? DateTime.parse(json['last_read_at'] as String)
          : null,
    );
  }

  /// Convertir en JSON pour stockage local
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_path': imagePath,
      'date': date.toIso8601String(),
      'category': category,
      'points': points,
      'content_path': contentPath,
      'reading_time': readingTime,
      'is_read': isRead,
      'last_read_at': lastReadAt?.toIso8601String(),
    };
  }

  /// Créer une copie avec modifications
  Article copyWith({
    bool? isRead,
    DateTime? lastReadAt,
  }) {
    return Article(
      id: id,
      title: title,
      imagePath: imagePath,
      date: date,
      category: category,
      points: points,
      contentPath: contentPath,
      readingTime: readingTime,
      isRead: isRead ?? this.isRead,
      lastReadAt: lastReadAt ?? this.lastReadAt,
    );
  }
}
