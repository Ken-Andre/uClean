import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Configuration centralisée de la gamification
class GamificationConfig {
  /// Points par événement
  final Map<String, int> pointsPerEvent;

  /// Seuils pour les achievements
  final Map<String, int> achievementThresholds;

  /// Multiplicateurs pour différents types d'activités
  final Map<String, double> activityMultipliers;

  /// Configuration des streaks
  final StreakConfig streakConfig;

  /// Configuration des niveaux
  final LevelConfig levelConfig;

  /// Paramètres de rétention des données
  final RetentionConfig retentionConfig;

  const GamificationConfig({
    required this.pointsPerEvent,
    required this.achievementThresholds,
    required this.activityMultipliers,
    required this.streakConfig,
    required this.levelConfig,
    required this.retentionConfig,
  });

  /// Configuration par défaut
  factory GamificationConfig.defaultConfig() {
    return GamificationConfig(
      pointsPerEvent: {
        'article_read': 5,
        'trip_recorded': 2,
        'trip_classified': 3,
        'weekly_streak': 10,
        'monthly_consistency': 15,
        'daily_goal': 5,
      },
      achievementThresholds: {
        'first_50': 50,
        'centurion': 100,
        'expert': 500,
        'reader': 25,
        'bookworm': 50,
        'tracker': 50,
        'explorer': 100,
        'week_warrior': 7,
        'month_master': 30,
      },
      activityMultipliers: {
        'article_reading': 1.0,
        'trip_recording': 1.0,
        'trip_classification': 1.2,
        'streak_bonus': 1.5,
      },
      streakConfig: StreakConfig(
        maxStreakDays: 365,
        streakBonusMultiplier: 1.5,
        streakResetThreshold: 2, // jours sans activité
      ),
      levelConfig: LevelConfig(
        pointsPerLevel: 100,
        maxLevel: 50,
        levelBonusMultiplier: 0.1,
      ),
      retentionConfig: RetentionConfig(
        historyRetentionDays: 90,
        achievementRetentionDays: 365,
        analyticsRetentionDays: 180,
      ),
    );
  }

  /// Crée une configuration depuis JSON
  factory GamificationConfig.fromJson(Map<String, dynamic> json) {
    return GamificationConfig(
      pointsPerEvent: Map<String, int>.from(json['points_per_event'] ?? {}),
      achievementThresholds:
          Map<String, int>.from(json['achievement_thresholds'] ?? {}),
      activityMultipliers:
          Map<String, double>.from(json['activity_multipliers'] ?? {}),
      streakConfig: StreakConfig.fromJson(json['streak_config'] ?? {}),
      levelConfig: LevelConfig.fromJson(json['level_config'] ?? {}),
      retentionConfig: RetentionConfig.fromJson(json['retention_config'] ?? {}),
    );
  }

  /// Convertit en JSON
  Map<String, dynamic> toJson() {
    return {
      'points_per_event': pointsPerEvent,
      'achievement_thresholds': achievementThresholds,
      'activity_multipliers': activityMultipliers,
      'streak_config': streakConfig.toJson(),
      'level_config': levelConfig.toJson(),
      'retention_config': retentionConfig.toJson(),
    };
  }

  /// Calcule les points pour un événement avec les multiplicateurs
  int calculatePoints(String event, {double? multiplier}) {
    final basePoints = pointsPerEvent[event] ?? 0;
    final eventMultiplier = multiplier ?? activityMultipliers[event] ?? 1.0;
    return (basePoints * eventMultiplier).round();
  }

  /// Copie avec modifications
  GamificationConfig copyWith({
    Map<String, int>? pointsPerEvent,
    Map<String, int>? achievementThresholds,
    Map<String, double>? activityMultipliers,
    StreakConfig? streakConfig,
    LevelConfig? levelConfig,
    RetentionConfig? retentionConfig,
  }) {
    return GamificationConfig(
      pointsPerEvent: pointsPerEvent ?? this.pointsPerEvent,
      achievementThresholds:
          achievementThresholds ?? this.achievementThresholds,
      activityMultipliers: activityMultipliers ?? this.activityMultipliers,
      streakConfig: streakConfig ?? this.streakConfig,
      levelConfig: levelConfig ?? this.levelConfig,
      retentionConfig: retentionConfig ?? this.retentionConfig,
    );
  }
}

/// Configuration des streaks
class StreakConfig {
  final int maxStreakDays;
  final double streakBonusMultiplier;
  final int streakResetThreshold;

  const StreakConfig({
    required this.maxStreakDays,
    required this.streakBonusMultiplier,
    required this.streakResetThreshold,
  });

  factory StreakConfig.fromJson(Map<String, dynamic> json) {
    return StreakConfig(
      maxStreakDays: json['max_streak_days'] ?? 365,
      streakBonusMultiplier:
          (json['streak_bonus_multiplier'] ?? 1.5).toDouble(),
      streakResetThreshold: json['streak_reset_threshold'] ?? 2,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max_streak_days': maxStreakDays,
      'streak_bonus_multiplier': streakBonusMultiplier,
      'streak_reset_threshold': streakResetThreshold,
    };
  }
}

/// Configuration des niveaux
class LevelConfig {
  final int pointsPerLevel;
  final int maxLevel;
  final double levelBonusMultiplier;

  const LevelConfig({
    required this.pointsPerLevel,
    required this.maxLevel,
    required this.levelBonusMultiplier,
  });

  factory LevelConfig.fromJson(Map<String, dynamic> json) {
    return LevelConfig(
      pointsPerLevel: json['points_per_level'] ?? 100,
      maxLevel: json['max_level'] ?? 50,
      levelBonusMultiplier: (json['level_bonus_multiplier'] ?? 0.1).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points_per_level': pointsPerLevel,
      'max_level': maxLevel,
      'level_bonus_multiplier': levelBonusMultiplier,
    };
  }
}

/// Configuration de rétention des données
class RetentionConfig {
  final int historyRetentionDays;
  final int achievementRetentionDays;
  final int analyticsRetentionDays;

  const RetentionConfig({
    required this.historyRetentionDays,
    required this.achievementRetentionDays,
    required this.analyticsRetentionDays,
  });

  factory RetentionConfig.fromJson(Map<String, dynamic> json) {
    return RetentionConfig(
      historyRetentionDays: json['history_retention_days'] ?? 90,
      achievementRetentionDays: json['achievement_retention_days'] ?? 365,
      analyticsRetentionDays: json['analytics_retention_days'] ?? 180,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history_retention_days': historyRetentionDays,
      'achievement_retention_days': achievementRetentionDays,
      'analytics_retention_days': analyticsRetentionDays,
    };
  }
}

/// Service de gestion de la configuration de gamification
class GamificationConfigService {
  static const String _configKey = 'gamification_config';
  static GamificationConfig? _currentConfig;

  /// Récupère la configuration actuelle
  static GamificationConfig get currentConfig {
    _currentConfig ??= GamificationConfig.defaultConfig();
    return _currentConfig!;
  }

  /// Définit une nouvelle configuration
  static Future<void> setConfig(GamificationConfig config) async {
    _currentConfig = config;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_configKey, json.encode(config.toJson()));

    print('Configuration de gamification mise à jour');
  }

  /// Charge la configuration depuis le stockage
  static Future<void> loadConfig() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? configData = prefs.getString(_configKey);

      if (configData != null) {
        final Map<String, dynamic> jsonData = json.decode(configData);
        _currentConfig = GamificationConfig.fromJson(jsonData);
        print('Configuration de gamification chargée');
      } else {
        _currentConfig = GamificationConfig.defaultConfig();
        print('Configuration par défaut chargée');
      }
    } catch (e) {
      print('Erreur lors du chargement de la configuration: $e');
      _currentConfig = GamificationConfig.defaultConfig();
    }
  }

  /// Réinitialise à la configuration par défaut
  static Future<void> resetToDefault() async {
    _currentConfig = GamificationConfig.defaultConfig();
    await setConfig(_currentConfig!);
  }

  /// Met à jour seulement les points par événement
  static Future<void> updatePointsConfig(Map<String, int> newPoints) async {
    final current = currentConfig;
    final updatedConfig = current.copyWith(
      pointsPerEvent: {...current.pointsPerEvent, ...newPoints},
    );
    await setConfig(updatedConfig);
  }

  /// Met à jour seulement les seuils d'achievements
  static Future<void> updateAchievementThresholds(
      Map<String, int> newThresholds) async {
    final current = currentConfig;
    final updatedConfig = current.copyWith(
      achievementThresholds: {
        ...current.achievementThresholds,
        ...newThresholds
      },
    );
    await setConfig(updatedConfig);
  }

  /// Met à jour les multiplicateurs d'activité
  static Future<void> updateActivityMultipliers(
      Map<String, double> newMultipliers) async {
    final current = currentConfig;
    final updatedConfig = current.copyWith(
      activityMultipliers: {...current.activityMultipliers, ...newMultipliers},
    );
    await setConfig(updatedConfig);
  }

  /// Génère des configurations prédéfinies pour différents cas d'usage
  static Map<String, GamificationConfig> getPresetConfigurations() {
    return {
      'conservative': GamificationConfig(
        pointsPerEvent: {
          'article_read': 3,
          'trip_recorded': 1,
          'trip_classified': 2,
          'weekly_streak': 5,
          'monthly_consistency': 10,
          'daily_goal': 2,
        },
        achievementThresholds: {
          'first_50': 50,
          'centurion': 100,
          'expert': 300,
          'reader': 15,
          'bookworm': 30,
          'tracker': 25,
          'explorer': 50,
          'week_warrior': 7,
          'month_master': 30,
        },
        activityMultipliers: {
          'article_reading': 1.0,
          'trip_recording': 1.0,
          'trip_classification': 1.1,
          'streak_bonus': 1.2,
        },
        streakConfig: StreakConfig(
          maxStreakDays: 365,
          streakBonusMultiplier: 1.2,
          streakResetThreshold: 3,
        ),
        levelConfig: LevelConfig(
          pointsPerLevel: 75,
          maxLevel: 40,
          levelBonusMultiplier: 0.05,
        ),
        retentionConfig: RetentionConfig(
          historyRetentionDays: 60,
          achievementRetentionDays: 365,
          analyticsRetentionDays: 120,
        ),
      ),
      'aggressive': GamificationConfig(
        pointsPerEvent: {
          'article_read': 8,
          'trip_recorded': 4,
          'trip_classified': 6,
          'weekly_streak': 15,
          'monthly_consistency': 25,
          'daily_goal': 8,
        },
        achievementThresholds: {
          'first_50': 50,
          'centurion': 100,
          'expert': 750,
          'reader': 40,
          'bookworm': 80,
          'tracker': 80,
          'explorer': 150,
          'week_warrior': 5,
          'month_master': 20,
        },
        activityMultipliers: {
          'article_reading': 1.3,
          'trip_recording': 1.2,
          'trip_classification': 1.5,
          'streak_bonus': 2.0,
        },
        streakConfig: StreakConfig(
          maxStreakDays: 365,
          streakBonusMultiplier: 2.0,
          streakResetThreshold: 1,
        ),
        levelConfig: LevelConfig(
          pointsPerLevel: 150,
          maxLevel: 75,
          levelBonusMultiplier: 0.15,
        ),
        retentionConfig: RetentionConfig(
          historyRetentionDays: 120,
          achievementRetentionDays: 365,
          analyticsRetentionDays: 240,
        ),
      ),
      'enterprise': GamificationConfig(
        pointsPerEvent: {
          'article_read': 5,
          'trip_recorded': 2,
          'trip_classified': 5, // Plus de points pour classification précise
          'weekly_streak': 10,
          'monthly_consistency': 20,
          'daily_goal': 5,
        },
        achievementThresholds: {
          'first_50': 50,
          'centurion': 100,
          'expert': 500,
          'reader': 25,
          'bookworm': 50,
          'tracker': 75, // Plus difficile pour les professionnels
          'explorer': 150,
          'week_warrior': 10, // Récompense la régularité professionnelle
          'month_master': 45,
        },
        activityMultipliers: {
          'article_reading': 1.0,
          'trip_recording': 1.0,
          'trip_classification': 1.8, // Encourage classification précise
          'streak_bonus': 1.3,
        },
        streakConfig: StreakConfig(
          maxStreakDays: 365,
          streakBonusMultiplier: 1.3,
          streakResetThreshold: 2,
        ),
        levelConfig: LevelConfig(
          pointsPerLevel: 100,
          maxLevel: 60,
          levelBonusMultiplier: 0.1,
        ),
        retentionConfig: RetentionConfig(
          historyRetentionDays: 180, // Plus long pour audit
          achievementRetentionDays: 365,
          analyticsRetentionDays: 365,
        ),
      ),
    };
  }

  /// Applique une configuration prédéfinie
  static Future<void> applyPreset(String presetName) async {
    final presets = getPresetConfigurations();
    final preset = presets[presetName];

    if (preset != null) {
      await setConfig(preset);
      print('Configuration prédéfinie appliquée: $presetName');
    } else {
      print('Configuration prédéfinie non trouvée: $presetName');
    }
  }

  /// Liste les configurations prédéfinies disponibles
  static List<String> getAvailablePresets() {
    return getPresetConfigurations().keys.toList();
  }

  /// Exporte la configuration actuelle
  static String exportConfig() {
    return json.encode(currentConfig.toJson());
  }

  /// Importe une configuration depuis JSON
  static Future<bool> importConfig(String configJson) async {
    try {
      final Map<String, dynamic> jsonData = json.decode(configJson);
      final config = GamificationConfig.fromJson(jsonData);
      await setConfig(config);
      return true;
    } catch (e) {
      print('Erreur lors de l\'import de la configuration: $e');
      return false;
    }
  }
}

/// Singleton global
final gamificationConfigService = GamificationConfigService();
