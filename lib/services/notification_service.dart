import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// TODO: Remplacer l'accès par singleton par une injection de dépendances (Règle #4).

/// Service de gestion des notifications locales.
class NotificationService {
  // --- Identifiants et canaux ---
  static const String _channelId = 'ucleankim_channel';
  static const String _channelName = 'uClean Notifications';
  static const String _channelDescription = 'Notifications pour uClean';

  // --- IDs de notifications uniques pour éviter les conflits ---
  static const int _dailyReminderId = 1;
  static const int _trackingStatusId = 2;
  static const int _achievementId = 3;
  static const int _tripDetectedId = 4;
  static const int _scheduledReminderId = 5;
  static const int _testNotificationId = 999;

  // Singleton
  static NotificationService? _instance;
  static NotificationService get instance {
    _instance ??= NotificationService._();
    return _instance!;
  }

  NotificationService._();

  late final FlutterLocalNotificationsPlugin _notifications;

  /// Initialise le service de notifications.
  Future<void> initialize() async {
    try {
      _notifications = FlutterLocalNotificationsPlugin();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings();

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await _notifications.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: _onNotificationTap,
      );

      await _createNotificationChannel();
      tz.initializeTimeZones();
      print('✅ Service de notifications initialisé');
    } catch (e) {
      print('🔴 ERREUR initialisation notifications: $e');
    }
  }

  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );
    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// **[FACTORISÉ]** Construit les détails de notification.
  NotificationDetails _buildDetails({
    Importance importance = Importance.defaultImportance,
    Priority priority = Priority.defaultPriority,
    bool ongoing = false,
  }) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: importance,
        priority: priority,
        ongoing: ongoing,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(),
    );
  }

  /// **[SÉCURISÉ]** Affiche une notification de manière générique.
  Future<void> _showNotification(
      int id, String title, String body, String payload) async {
    try {
      final details =
          _buildDetails(importance: Importance.high, priority: Priority.high);
      await _notifications.show(id, title, body, details, payload: payload);
    } catch (e) {
      print('🔴 ERREUR affichage notification #$id: $e');
    }
  }

  void _onNotificationTap(NotificationResponse response) {
    final String? payload = response.payload;
    if (payload != null) {
      print('Notification tapée avec payload: $payload');
      // TODO: Implémenter la navigation
    }
  }

  Future<void> showDailyReminder() async {
    await _showNotification(_dailyReminderId, 'Rappel quotidien',
        'N\'oubliez pas d\'enregistrer vos déplacements !', 'daily_reminder');
  }

  Future<void> showTrackingStatusNotification(bool isActive) async {
    try {
      if (isActive) {
        final details = _buildDetails(
            importance: Importance.low, priority: Priority.low, ongoing: true);
        await _notifications.show(_trackingStatusId, 'Tracking actif',
            'Votre suivi est en cours', details,
            payload: 'tracking_status');
      } else {
        await _notifications.cancel(_trackingStatusId);
      }
    } catch (e) {
      print('🔴 ERREUR maj notification de tracking: $e');
    }
  }

  Future<void> showAchievementNotification(
      String achievement, int points) async {
    await _showNotification(_achievementId, '🎉 Nouvel achievement !',
        '$achievement (+$points points)', 'achievement');
  }

  Future<void> showTripDetectedNotification(double distance) async {
    await _showNotification(
        _tripDetectedId,
        'Déplacement détecté',
        'Un déplacement de ${distance.toStringAsFixed(1)} km a été enregistré',
        'trip_detected');
  }

  Future<void> scheduleDailyNotification(TimeOfDay time) async {
    try {
      await _notifications.zonedSchedule(
        _scheduledReminderId,
        'Rappel quotidien',
        'Pensez à enregistrer vos déplacements !',
        _nextInstanceOfTime(time),
        _buildDetails(),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'daily_reminder',
      );
    } catch (e) {
      print('🔴 ERREUR planification notification: $e');
    }
  }

  Future<void> showTestNotification() async {
    await _showNotification(
        _testNotificationId, 'Test Notification', 'Ceci est un test.', 'test');
  }

  Future<void> cancelScheduledNotification(int id) async =>
      await _notifications.cancel(id);
  Future<void> cancelAllNotifications() async =>
      await _notifications.cancelAll();

  tz.TZDateTime _nextInstanceOfTime(TimeOfDay time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<bool> requestNotificationPermission() async {
    try {
      final plugin = _notifications.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      return await plugin?.requestNotificationsPermission() ?? false;
    } catch (e) {
      print('🔴 ERREUR demande permission notifications: $e');
      return false;
    }
  }
}

/// Singleton global.
final notificationService = NotificationService.instance;
