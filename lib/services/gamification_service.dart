import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/gamification_config_service.dart';
import 'api_gamification_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../core/utils/logger.dart';
import 'points_config_service.dart';

/// Service de gestion de la gamification avec configuration dynamique et synchronisation API
class GamificationService {
  static const String _storageKey = 'gamification_data';
  static const String _totalPointsKey = 'total_points';
  static const String _readingPointsKey = 'reading_points';
  static const String _trackingPointsKey = 'tracking_points';
  static const String _achievementsKey = 'achievements';
  static const String _lastSyncKey = 'last_sync_timestamp';
  static const String _pendingSyncKey = 'pending_points_to_sync';

  final ApiGamificationService _apiService = ApiGamificationService();

  /// Événements de gamification
  static const String eventArticleRead = 'article_read';
  static const String eventTripRecorded = 'trip_recorded';
  static const String eventTripClassified = 'trip_classified';
  static const String eventWeeklyStreak = 'weekly_streak';
  static const String eventConsistency = 'consistency';

  /// Récupère les données de gamification actuelles
  Future<Map<String, dynamic>> getGamificationData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_storageKey);

    if (data != null) {
      return json.decode(data) as Map<String, dynamic>;
    }

    // Données par défaut
    return {
      _totalPointsKey: 0,
      _readingPointsKey: 0,
      _trackingPointsKey: 0,
      _achievementsKey: [],
      'last_activity': null,
      'current_streak': 0,
      'longest_streak': 0,
      'weekly_streak': 0,
      'monthly_consistency': 0,
    };
  }

  /// Sauvegarde les données de gamification
  Future<void> _saveGamificationData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, json.encode(data));
  }

  /// Ajoute des points pour un événement spécifique avec configuration dynamique
  Future<int> addPoints(String event, {Map<String, dynamic>? metadata}) async {
    final data = await getGamificationData();
    final pointsConfig = PointsConfigService.currentConfig;
    final gamificationConfig = GamificationConfigService.currentConfig;

    // Calculer les points selon la configuration des points
    final basePoints = pointsConfig.getPointsForEvent(event);
    final multiplier = metadata?['multiplier'] as double? ??
        gamificationConfig.activityMultipliers[event] ??
        1.0;
    final pointsToAdd = (basePoints * multiplier).round();

    if (pointsToAdd > 0) {
      // Vérifier si nous avons des données API synchronisées
      final bool apiSynced = data['api_synced'] as bool? ?? false;
      final int currentApiTotal = data[_totalPointsKey] as int? ?? 0;

      // Si nous avons des données API, ajouter aux points API existants
      // Sinon, utiliser le système local traditionnel
      if (apiSynced && currentApiTotal > 0) {
        // Mode API-synced: ajouter aux points API existants
        final int newTotal = currentApiTotal + pointsToAdd;
        data[_totalPointsKey] = newTotal;
        print('🔄 Mode API-sync: $currentApiTotal + $pointsToAdd = $newTotal points');
      } else {
        // Mode local traditionnel
        final int currentTotal = data[_totalPointsKey] as int? ?? 0;
        final int newTotal = currentTotal + pointsToAdd;
        data[_totalPointsKey] = newTotal;
        print('🏠 Mode local: $currentTotal + $pointsToAdd = $newTotal points');
      }

      // Mettre à jour les catégories de points
      if (event == eventArticleRead) {
        final int currentReading = data[_readingPointsKey] as int? ?? 0;
        data[_readingPointsKey] = currentReading + pointsToAdd;
      } else if (event.startsWith('trip_')) {
        final int currentTracking = data[_trackingPointsKey] as int? ?? 0;
        data[_trackingPointsKey] = currentTracking + pointsToAdd;
      }

      // Mettre à jour la dernière activité
      data['last_activity'] = DateTime.now().toIso8601String();

      // Mettre à jour les streaks
      await _updateStreaks(data);

      // Ajouter l'événement à l'historique
      final history = data['history'] as List<dynamic>? ?? [];
      history.add({
        'event': event,
        'points': pointsToAdd,
        'base_points': basePoints,
        'multiplier': multiplier,
        'timestamp': DateTime.now().toIso8601String(),
        'metadata': metadata ?? {},
      });

      // Garder seulement les 100 derniers événements
      if (history.length > 100) {
        history.removeRange(0, history.length - 100);
      }
      data['history'] = history;

      await _saveGamificationData(data);
    }

    return pointsToAdd;
  }

  /// Met à jour les streaks (séquences d'activité)
  Future<void> _updateStreaks(Map<String, dynamic> data) async {
    final config = GamificationConfigService.currentConfig;
    final now = DateTime.now();
    final lastActivityStr = data['last_activity'] as String?;

    if (lastActivityStr == null) {
      data['current_streak'] = 1;
      data['weekly_streak'] = 1;
      data['monthly_consistency'] = 1;
      return;
    }

    final lastActivity = DateTime.parse(lastActivityStr);
    final daysDiff = now.difference(lastActivity).inDays;

    // Streak quotidien
    if (daysDiff <= config.streakConfig.streakResetThreshold) {
      final currentStreak = data['current_streak'] as int? ?? 0;
      data['current_streak'] = currentStreak + 1;

      // Mettre à jour le record
      final longestStreak = data['longest_streak'] as int? ?? 0;
      if (currentStreak + 1 > longestStreak) {
        data['longest_streak'] = currentStreak + 1;
      }
    } else {
      data['current_streak'] = 1;
    }

    // Streak hebdomadaire (activité cette semaine)
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final lastActivityThisWeek = lastActivity.isAfter(weekStart);

    if (lastActivityThisWeek || daysDiff <= 7) {
      final weeklyStreak = data['weekly_streak'] as int? ?? 0;
      data['weekly_streak'] = weeklyStreak + 1;
    } else {
      data['weekly_streak'] = 1;
    }

    // Cohérence mensuelle (activité ce mois)
    final monthStart = DateTime(now.year, now.month, 1);
    final lastActivityThisMonth = lastActivity.isAfter(monthStart);

    if (lastActivityThisMonth || daysDiff <= 31) {
      final monthlyConsistency = data['monthly_consistency'] as int? ?? 0;
      data['monthly_consistency'] = monthlyConsistency + 1;
    } else {
      data['monthly_consistency'] = 1;
    }
  }

  /// Récupère les points totaux
  Future<int> getTotalPoints() async {
    final data = await getGamificationData();
    return data[_totalPointsKey] as int? ?? 0;
  }

  /// Récupère les points par catégorie
  Future<Map<String, int>> getPointsByCategory() async {
    final data = await getGamificationData();
    return {
      'reading': data[_readingPointsKey] as int? ?? 0,
      'tracking': data[_trackingPointsKey] as int? ?? 0,
    };
  }

  /// Récupère les achievements (succès) avec configuration dynamique
  Future<List<String>> getAchievements() async {
    final data = await getGamificationData();
    return (data[_achievementsKey] as List<dynamic>?)?.cast<String>() ?? [];
  }

  /// Vérifie et ajoute les achievements avec configuration dynamique
  Future<List<String>> checkAndAddAchievements() async {
    final data = await getGamificationData();
    final achievements =
        (data[_achievementsKey] as List<dynamic>?)?.cast<String>() ?? [];
    final totalPoints = data[_totalPointsKey] as int? ?? 0;
    final currentStreak = data['current_streak'] as int? ?? 0;
    final readingPoints = data[_readingPointsKey] as int? ?? 0;
    final trackingPoints = data[_trackingPointsKey] as int? ?? 0;
    final config = GamificationConfigService.currentConfig;

    // Achievements basés sur les points avec seuils configurables
    for (final entry in config.achievementThresholds.entries) {
      final achievementName = entry.key;
      final threshold = entry.value;

      if (totalPoints >= threshold && !achievements.contains(achievementName)) {
        achievements.add(achievementName);
      }
    }

    // Achievements basés sur la lecture
    if (readingPoints >= config.achievementThresholds['reader']! &&
        !achievements.contains('reader')) {
      achievements.add('reader');
    }
    if (readingPoints >= config.achievementThresholds['bookworm']! &&
        !achievements.contains('bookworm')) {
      achievements.add('bookworm');
    }

    // Achievements basés sur le tracking
    if (trackingPoints >= config.achievementThresholds['tracker']! &&
        !achievements.contains('tracker')) {
      achievements.add('tracker');
    }
    if (trackingPoints >= config.achievementThresholds['explorer']! &&
        !achievements.contains('explorer')) {
      achievements.add('explorer');
    }

    // Achievements basés sur les streaks
    if (currentStreak >= config.achievementThresholds['week_warrior']! &&
        !achievements.contains('week_warrior')) {
      achievements.add('week_warrior');
    }
    if (currentStreak >= config.achievementThresholds['month_master']! &&
        !achievements.contains('month_master')) {
      achievements.add('month_master');
    }

    // Sauvegarder les nouveaux achievements
    final currentAchievementsCount =
        (data[_achievementsKey] as List<dynamic>?)?.length ?? 0;
    if (achievements.length > currentAchievementsCount) {
      data[_achievementsKey] = achievements;
      await _saveGamificationData(data);
    }

    return achievements;
  }

  /// Récupère les statistiques de gamification
  Future<Map<String, dynamic>> getStats() async {
    final data = await getGamificationData();
    final config = GamificationConfigService.currentConfig;

    return {
      'total_points': data[_totalPointsKey] as int? ?? 0,
      'reading_points': data[_readingPointsKey] as int? ?? 0,
      'tracking_points': data[_trackingPointsKey] as int? ?? 0,
      'current_streak': data['current_streak'] as int? ?? 0,
      'longest_streak': data['longest_streak'] as int? ?? 0,
      'weekly_streak': data['weekly_streak'] as int? ?? 0,
      'monthly_consistency': data['monthly_consistency'] as int? ?? 0,
      'achievements_count':
          (data[_achievementsKey] as List<dynamic>?)?.length ?? 0,
      'level': ((data[_totalPointsKey] as int? ?? 0) /
                  config.levelConfig.pointsPerLevel)
              .floor() +
          1,
      'points_to_next_level': config.levelConfig.pointsPerLevel -
          ((data[_totalPointsKey] as int? ?? 0) %
              config.levelConfig.pointsPerLevel),
    };
  }

  /// Récupère l'historique des événements avec rétention configurable
  Future<List<Map<String, dynamic>>> getHistory({int? limit}) async {
    final data = await getGamificationData();
    final history = data['history'] as List<dynamic>? ?? [];
    final config = GamificationConfigService.currentConfig;

    // Appliquer la rétention
    final retentionDate = DateTime.now()
        .subtract(Duration(days: config.retentionConfig.historyRetentionDays));

    final filteredHistory = history.where((event) {
      final eventDate = DateTime.parse(event['timestamp'] as String);
      return eventDate.isAfter(retentionDate);
    }).toList();

    if (limit != null && filteredHistory.length > limit) {
      return filteredHistory
          .sublist(filteredHistory.length - limit)
          .cast<Map<String, dynamic>>();
    }

    return filteredHistory.cast<Map<String, dynamic>>();
  }

  /// Calcule le niveau actuel selon la configuration
  int calculateLevel(int totalPoints) {
    final config = GamificationConfigService.currentConfig;
    return (totalPoints / config.levelConfig.pointsPerLevel).floor() + 1;
  }

  /// Calcule les points nécessaires pour le prochain niveau
  int pointsToNextLevel(int totalPoints) {
    final config = GamificationConfigService.currentConfig;
    return config.levelConfig.pointsPerLevel -
        (totalPoints % config.levelConfig.pointsPerLevel);
  }

  /// Reset les données (pour tests ou nouvelle session)
  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }

  /// Synchronise les données de gamification depuis l'API avec fallback sur le cache local
  Future<void> syncDataFromAPI() async {
    print('🟠 Vérification connectivité pour sync API...');
    try {
      // Vérifier la connectivité
      final connectivityResult = await Connectivity().checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;

      print(
          '🔗 État connectivité: ${isOnline ? 'EN LIGNE' : 'HORS LIGNE'}');

      if (isOnline) {
        print('📡 Tentative récupération données depuis API...');
        try {
          // Récupérer les données depuis l'API
          final apiPoints = await _apiService.getGamificationPoints();
          print(
              '📋 Points récupérés depuis API: ${apiPoints.length} points');

          if (apiPoints.isNotEmpty) {
            final currentLocalPoints = await getTotalPoints();
            print('🏠 Points locaux actuels: $currentLocalPoints');

            final data = await getGamificationData();

            // Calculer le total des points depuis l'API
            final apiTotalPoints =
                apiPoints.fold<int>(0, (sum, point) => sum + point.points);
            print('☁️ Total points API: $apiTotalPoints');

            // Utiliser les données API si elles sont plus récentes ou plus complètes
            data[_totalPointsKey] = apiTotalPoints;

            // Tenter de distribuer les points par catégories (basé sur l'historique disponible)
            // Cette logique peut être affinée selon les besoins métier
            data['api_synced'] = true;
            data[_lastSyncKey] = DateTime.now().toIso8601String();

            await _saveGamificationData(data);
            print('💾 Données mises à jour avec les données API');
          } else {
            print('⚠️ Aucun point récupéré depuis l\'API');
          }
        } catch (apiError) {
          print(
              '❌ Erreur lors de la synchronisation depuis l\'API: $apiError');

          // Check if it's an authentication error
          if (apiError.toString().contains('401')) {
            print(
                '🔒 Erreur 401 détectée - Token invalide, utilisation du cache local');
          } else if (apiError.toString().contains('403')) {
            print(
                '🚫 Erreur 403 détectée - Accès interdit, utilisation du cache local');
          }

          // Continuer avec les données locales (fallback déjà implémenté dans getGamificationData)
        }
      } else {
        print('📴 Hors ligne - utilisation du cache local');
      }
      // Si hors ligne, utiliser le cache local (déjà géré)
    } catch (error) {
      print('❌ Erreur générale lors de la synchronisation: $error');
      // Ignorer l'erreur et utiliser le cache local
    }
  }

  /// Envoie des points gagnés à l'API avec gestion des erreurs hors ligne
  Future<bool> sendPointsToAPI({
    required int points,
    required String event,
    required DateTime awardedAt,
  }) async {
    print(
        '🚀 Tentative d\'envoi de $points points à l\'API pour l\'événement: $event');
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      final isOnline = connectivityResult != ConnectivityResult.none;
      print('🔗 État connectivité: ${isOnline ? 'EN LIGNE' : 'HORS LIGNE'}');

      if (isOnline) {
        try {
          print('📡 Envoi des points à l\'API...');
          final result = await _apiService.addGamificationPoint(
              points: points, awardedAt: awardedAt);
          if (result != null) {
            print(
                '✅ Points envoyés avec succès à l\'API: ${result.points} points');
            return true; // Succès
          } else {
            // API a retourné null (erreur 401 ou autre)
            print('⚠️ API a retourné null - stockage pour sync ultérieur');
            await _storePendingPoints(points, event, awardedAt);
            return false;
          }
        } catch (apiError) {
          print('❌ Erreur lors de l\'envoi à l\'API: $apiError');
          print('📦 Stockage des points pour sync ultérieur');

          // Stocker les points pour synchronisation ultérieure
          await _storePendingPoints(points, event, awardedAt);
          return false; // Échec mais stocké pour retry
        }
      } else {
        // Hors ligne - stocker pour sync ultérieure
        print('📴 Hors ligne - stockage des points pour sync ultérieure');
        await _storePendingPoints(points, event, awardedAt);
        return false;
      }
    } catch (error) {
      print('❌ Erreur générale lors de l\'envoi des points à l\'API: $error');
      await _storePendingPoints(points, event, awardedAt);
      return false;
    }
  }

  /// Stocke les points en attente de synchronisation
  Future<void> _storePendingPoints(
      int points, String event, DateTime awardedAt) async {
    final prefs = await SharedPreferences.getInstance();
    final pendingList = prefs.getStringList(_pendingSyncKey) ?? [];

    final pendingPoint = {
      'points': points,
      'event': event,
      'awarded_at': awardedAt.toIso8601String(),
      'timestamp': DateTime.now().toIso8601String(),
    };

    pendingList.add(json.encode(pendingPoint));

    // Garder seulement les 50 derniers éléments pour éviter la surcharge
    if (pendingList.length > 50) {
      pendingList.removeRange(0, pendingList.length - 50);
    }

    await prefs.setStringList(_pendingSyncKey, pendingList);
  }

  /// Synchronise les points en attente vers l'API
  Future<int> syncPendingPointsToAPI() async {
    final prefs = await SharedPreferences.getInstance();
    final pendingList = prefs.getStringList(_pendingSyncKey) ?? [];

    if (pendingList.isEmpty) return 0;

    final connectivityResult = await Connectivity().checkConnectivity();
    final isOnline = connectivityResult != ConnectivityResult.none;

    if (!isOnline) return 0;

    int syncedCount = 0;
    final remainingPending = <String>[];

    for (final pendingJson in pendingList) {
      try {
        final pendingPoint = json.decode(pendingJson) as Map<String, dynamic>;
        final points = pendingPoint['points'] as int;
        final awardedAt = DateTime.parse(pendingPoint['awarded_at'] as String);

        final result = await _apiService.addGamificationPoint(
            points: points, awardedAt: awardedAt);
        if (result != null) {
          syncedCount++;
        } else {
          // Échec de la sync, garder pour prochaine tentative
          remainingPending.add(pendingJson);
        }
      } catch (error) {
        Logger.log('Erreur lors de la sync d\'un point en attente: $error');
        // Garder en attente pour prochaine tentative
        remainingPending.add(pendingJson);
      }
    }

    // Mettre à jour la liste des points en attente
    await prefs.setStringList(_pendingSyncKey, remainingPending);

    return syncedCount;
  }

  /// Méthode principale pour ajouter des points avec synchronisation API
  Future<int> addPointsWithAPISync(String event,
      {Map<String, dynamic>? metadata}) async {
    print('🎯 addPoints appelé pour l\'événement: $event');
    // Ajouter les points localement
    final pointsAdded = await addPoints(event, metadata: metadata);
    print('🏠 Points ajoutés localement: $pointsAdded');

    if (pointsAdded > 0) {
      print('🔄 Tentative de synchronisation avec l\'API...');
      // Tenter d'envoyer à l'API de manière asynchrone
      final awardedAt = DateTime.now();
      sendPointsToAPI(points: pointsAdded, event: event, awardedAt: awardedAt)
          .then((success) {
        if (success) {
          print('✅ Points synchronisés avec succès vers l\'API');
        } else {
          print(
              '⚠️ Échec de la synchronisation, points stockés pour plus tard');
        }
      }).catchError((error) {
        print('❌ Erreur lors de la synchronisation des points: $error');
      });
    } else {
      print('⚠️ Aucun point ajouté, pas de synchronisation nécessaire');
    }

    return pointsAdded;
  }

  /// Vérifie s'il y a des points en attente de synchronisation
  Future<int> getPendingPointsCount() async {
    final prefs = await SharedPreferences.getInstance();
    final pendingList = prefs.getStringList(_pendingSyncKey) ?? [];
    return pendingList.length;
  }

  /// Initialise la synchronisation au démarrage de l'app
  Future<void> initializeSync() async {
    print('🟡 Initialisation sync gamification...');
    try {
      await syncDataFromAPI(); // Sync données depuis API
      print('✅ Sync données depuis API terminée');
    } catch (e) {
      print('❌ Erreur sync données depuis API: $e');
    }

    try {
      final syncedCount =
          await syncPendingPointsToAPI(); // Sync points en attente
      print(
          '✅ Sync points en attente terminée: $syncedCount points synchronisés');
    } catch (e) {
      print('❌ Erreur sync points en attente: $e');
    }
  }
}
