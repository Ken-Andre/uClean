import 'package:permission_handler/permission_handler.dart';

/// Service de gestion des permissions
class PermissionService {
  /// Liste des permissions requises
  static const List<Permission> _requiredPermissions = [
    Permission.location,
    Permission.activityRecognition, // Pour le comptage de pas
    Permission.notification, // Pour les notifications de tracking
  ];

  /// Vérifie si une permission spécifique est accordée
  Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  /// Demande une permission spécifique
  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();

    if (status.isGranted) {
      print('Permission ${permission.toString()} accordée');
      return true;
    } else if (status.isDenied) {
      print('Permission ${permission.toString()} refusée');
      return false;
    } else if (status.isPermanentlyDenied) {
      print('Permission ${permission.toString()} définitivement refusée');
      await openAppSettings(); // Ouvrir les paramètres de l'app
      return false;
    }

    return false;
  }

  /// Vérifie et demande toutes les permissions nécessaires
  Future<Map<Permission, bool>> checkAndRequestAllPermissions() async {
    final Map<Permission, bool> results = {};

    for (final permission in _requiredPermissions) {
      final isGranted = await isPermissionGranted(permission);

      if (!isGranted) {
        // Demander la permission
        final requested = await requestPermission(permission);
        results[permission] = requested;
      } else {
        results[permission] = true;
      }
    }

    return results;
  }

  /// Vérifie si toutes les permissions sont accordées
  Future<bool> areAllPermissionsGranted() async {
    for (final permission in _requiredPermissions) {
      if (!await isPermissionGranted(permission)) {
        return false;
      }
    }
    return true;
  }

  /// Ouvre les paramètres de l'application
  Future<void> openAppSettings() async {
    await openAppSettings();
  }

  /// Affiche un dialogue explicatif pour une permission
  Future<bool> requestPermissionWithExplanation(
    Permission permission,
    String title,
    String message,
  ) async {
    // Vérifier d'abord le statut
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    // Ici on pourrait afficher un dialogue d'explication personnalisé
    // avant de demander la permission

    return await requestPermission(permission);
  }

  /// Vérifie les permissions pour le tracking automatique
  Future<bool> checkTrackingPermissions() async {
    // Vérifier les permissions essentielles pour le tracking
    const trackingPermissions = [
      Permission.activityRecognition, // Comptage de pas
      Permission.location, // Géolocalisation approximative
    ];

    for (final permission in trackingPermissions) {
      if (!await isPermissionGranted(permission)) {
        return false;
      }
    }

    return true;
  }

  /// Demande les permissions pour le tracking automatique
  Future<bool> requestTrackingPermissions() async {
    const trackingPermissions = [
      Permission.activityRecognition,
      Permission.location,
    ];

    bool allGranted = true;

    for (final permission in trackingPermissions) {
      final granted = await requestPermissionWithExplanation(
        permission,
        'Permission nécessaire',
        'Cette permission est requise pour le suivi automatique de vos déplacements.',
      );

      if (!granted) {
        allGranted = false;
      }
    }

    return allGranted;
  }

  /// Récupère le statut détaillé d'une permission
  Future<PermissionStatus> getPermissionStatus(Permission permission) async {
    return await permission.status;
  }

  /// Liste des permissions avec leur statut
  Future<Map<Permission, PermissionStatus>> getAllPermissionStatuses() async {
    final Map<Permission, PermissionStatus> statuses = {};

    for (final permission in _requiredPermissions) {
      statuses[permission] = await getPermissionStatus(permission);
    }

    return statuses;
  }
}

/// Singleton global
final permissionService = PermissionService();
