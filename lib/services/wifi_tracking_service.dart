import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

// TODO: Remplacer l'accès par singleton par une injection de dépendances (Règle #4).

/// Types de lieux basés sur les réseaux WiFi.
enum LocationType {
  professional, // Bureau, entreprise, travail
  personal, // Maison, domicile
  public, // Café, restaurant, lieu public
  transport, // Gare, aéroport, transport
  unknown, // Inconnu ou non classifié
}

/// Service de tracking WiFi pour classification professionnelle/personnel.
class WifiTrackingService {
  static const String _wifiProfilesKey = 'wifi_profiles';

  // Singleton
  static WifiTrackingService? _instance;
  static WifiTrackingService get instance {
    _instance ??= WifiTrackingService._();
    return _instance!;
  }

  WifiTrackingService._();

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  Timer? _periodicCheckTimer;
  bool _isTracking = false;

  final Map<String, LocationProfile> _wifiProfiles = {};
  final List<WifiConnection> _connectionHistory = [];

  bool get isTracking => _isTracking;

  // Mots-clés pour la classification automatique. Moins de mots, plus ciblés.
  static const Map<LocationType, List<String>> _classificationKeywords = {
    LocationType.professional: [
      'office',
      'bureau',
      'corp',
      'pro',
      'work',
      'uha-personnel',
      'uha-etudiants'
    ],
    LocationType.personal: [
      'home',
      'maison',
      'perso',
      'livebox',
      'freebox',
      'bbox'
    ],
    LocationType.public: ['cafe', 'public', 'guest', 'hotspot'],
    LocationType.transport: ['gare', 'station', 'airport', 'sncf', 'ratp'],
  };

  /// Démarre le tracking WiFi.
  Future<void> startTracking() async {
    if (_isTracking) return;
    _isTracking = true;

    try {
      await _loadWifiProfiles();

      _connectivitySubscription =
          Connectivity().onConnectivityChanged.listen(_onConnectivityChanged);

      _periodicCheckTimer = Timer.periodic(
        const Duration(minutes: 5), // Intervalle de vérification
        (timer) => _checkCurrentWifi(),
      );

      await _checkCurrentWifi(); // Vérification initiale
      print('✅ WiFi Tracking démarré');
    } catch (e) {
      print('🔴 Erreur au démarrage du WiFi Tracking: $e');
      _isTracking = false;
    }
  }

  /// Arrête le tracking WiFi.
  Future<void> stopTracking() async {
    if (!_isTracking) return;
    _isTracking = false;

    await _connectivitySubscription?.cancel();
    _periodicCheckTimer?.cancel();
    print('⏹️ WiFi Tracking arrêté');
  }

  /// Récupère la classification actuelle basée sur le WiFi.
  Future<LocationClassification> getCurrentLocationClassification() async {
    try {
      final wifiInfo = await _getCurrentWifiInfo();

      if (wifiInfo != null) {
        // 1. Vérifier si un profil manuel existe pour ce réseau.
        final profile = _wifiProfiles[wifiInfo.ssid];
        if (profile != null) {
          return LocationClassification(
            type: profile.type,
            confidence: profile.confidence,
            ssid: wifiInfo.ssid,
            timestamp: DateTime.now(),
            customName: profile.name,
          );
        }

        // 2. Sinon, classification automatique basée sur le nom du réseau.
        return _classifyWifiNetwork(wifiInfo.ssid);
      }

      // Si pas de WiFi, lieu inconnu.
      return LocationClassification.unknown();
    } catch (e) {
      print('🔴 Erreur lors de la récupération de la classification: $e');
      return LocationClassification.unknown();
    }
  }

  // --- Gestion des profils ---

  Future<void> addWifiProfile(LocationProfile profile) async {
    _wifiProfiles[profile.ssid] = profile;
    await _saveWifiProfiles();
  }

  Future<void> removeWifiProfile(String ssid) async {
    _wifiProfiles.remove(ssid);
    await _saveWifiProfiles();
  }

  Map<String, LocationProfile> getWifiProfiles() =>
      Map.unmodifiable(_wifiProfiles);
  List<WifiConnection> getConnectionHistory() =>
      List.unmodifiable(_connectionHistory);

  // --- Méthodes privées ---

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi)) {
      _checkCurrentWifi();
    } else {
      print('WiFi déconnecté.');
    }
  }

  Future<void> _checkCurrentWifi() async {
    if (!_isTracking) return;

    try {
      final classification = await getCurrentLocationClassification();
      if (classification.ssid != null) {
        _connectionHistory
            .add(WifiConnection.fromClassification(classification));
        if (_connectionHistory.length > 50) {
          _connectionHistory.removeRange(0, _connectionHistory.length - 50);
        }
        print(
            'WiFi détecté: ${classification.ssid} (${classification.type.name})');
      }
    } catch (e) {
      print('🔴 Erreur lors de la vérification WiFi: $e');
    }
  }

  /// **[CORRIGÉ]** Récupère les informations WiFi actuelles avec gestion des permissions.
  Future<WifiInfo?> _getCurrentWifiInfo() async {
    try {
      // Vérifier la connexion WiFi
      final connectivity = Connectivity();
      final connectivityResult = await connectivity.checkConnectivity();
      final isWifi = connectivityResult.contains(ConnectivityResult.wifi);

      if (!isWifi) {
        return null;
      }

      // Demander les permissions nécessaires pour Android
      if (await _requestLocationPermission()) {
        final networkInfo = NetworkInfo();
        String? ssid = await networkInfo.getWifiName();
        
        // Sanitize SSID - remove quotes and special characters
        if (ssid != null && ssid.isNotEmpty) {
          ssid = _sanitizeSsid(ssid);
          if (ssid.isNotEmpty) {
            return WifiInfo(ssid: ssid);
          }
        }
      } else {
        print('⚠️ Permission de localisation refusée - impossible d\'accéder au WiFi');
      }
      
      return null;
    } catch (e) {
      print('🔴 Erreur récupération infos WiFi: $e');
      return null;
    }
  }

  /// Demande la permission de localisation (nécessaire pour accéder au WiFi sur Android)
  Future<bool> _requestLocationPermission() async {
    try {
      final status = await Permission.locationWhenInUse.status;
      
      if (status.isGranted) {
        return true;
      }
      
      if (status.isDenied) {
        final result = await Permission.locationWhenInUse.request();
        return result.isGranted;
      }
      
      return false;
    } catch (e) {
      print('🔴 Erreur lors de la demande de permission: $e');
      return false;
    }
  }

  /// Nettoie le SSID en retirant les guillemets et caractères spéciaux
  String _sanitizeSsid(String ssid) {
    // Retirer les guillemets souvent ajoutés par Android
    String cleaned = ssid.replaceAll('"', '').trim();
    
    // Retirer les caractères de contrôle et autres caractères problématiques
    cleaned = cleaned.replaceAll(RegExp(r'[\x00-\x1F\x7F]'), '');
    
    return cleaned;
  }

  LocationClassification _classifyWifiNetwork(String ssid) {
    final ssidLower = ssid.toLowerCase();
    for (final entry in _classificationKeywords.entries) {
      if (entry.value.any((keyword) => ssidLower.contains(keyword))) {
        return LocationClassification(
          type: entry.key,
          confidence: 0.7, // Confiance de base pour une classification auto
          ssid: ssid,
          timestamp: DateTime.now(),
        );
      }
    }
    return LocationClassification.unknown(ssid: ssid);
  }

  /// **[IMPLÉMENTÉ]** Sauvegarde les profils WiFi dans le stockage local.
  Future<void> _saveWifiProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, String> serializedProfiles = _wifiProfiles
          .map((key, value) => MapEntry(key, json.encode(value.toJson())));
      await prefs.setString(_wifiProfilesKey, json.encode(serializedProfiles));
    } catch (e) {
      print('🔴 Erreur sauvegarde profils WiFi: $e');
    }
  }

  /// **[IMPLÉMENTÉ]** Charge les profils WiFi depuis le stockage local.
  Future<void> _loadWifiProfiles() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_wifiProfilesKey);

      if (jsonString != null) {
        final Map<String, dynamic> decodedProfiles = json.decode(jsonString);
        _wifiProfiles.clear();
        decodedProfiles.forEach((key, value) {
          _wifiProfiles[key] = LocationProfile.fromJson(json.decode(value));
        });
        print('✅ ${_wifiProfiles.length} profils WiFi chargés.');
      }
    } catch (e) {
      print('🔴 Erreur chargement profils WiFi: $e');
    }
  }
}

// --- Modèles de données ---

class WifiInfo {
  final String ssid;
  const WifiInfo({required this.ssid});
}

class LocationProfile {
  final String ssid;
  final LocationType type;
  final String name;
  final double confidence;
  final DateTime addedAt;

  const LocationProfile({
    required this.ssid,
    required this.type,
    required this.name,
    required this.confidence,
    required this.addedAt,
  });

  Map<String, dynamic> toJson() => {
        'ssid': ssid,
        'type': type.name,
        'name': name,
        'confidence': confidence,
        'addedAt': addedAt.toIso8601String(),
      };

  factory LocationProfile.fromJson(Map<String, dynamic> json) =>
      LocationProfile(
        ssid: json['ssid'],
        type: LocationType.values.firstWhere((t) => t.name == json['type'],
            orElse: () => LocationType.unknown),
        name: json['name'],
        confidence: json['confidence'],
        addedAt: DateTime.parse(json['addedAt']),
      );
}

class WifiConnection {
  final String ssid;
  final LocationType type;
  final DateTime timestamp;

  const WifiConnection({
    required this.ssid,
    required this.type,
    required this.timestamp,
  });

  factory WifiConnection.fromClassification(
          LocationClassification classification) =>
      WifiConnection(
        ssid: classification.ssid ?? 'N/A',
        type: classification.type,
        timestamp: classification.timestamp,
      );
}

class LocationClassification {
  final LocationType type;
  final double confidence;
  final String? ssid;
  final DateTime timestamp;
  final String? customName;

  const LocationClassification({
    required this.type,
    required this.confidence,
    required this.ssid,
    required this.timestamp,
    this.customName,
  });

  factory LocationClassification.unknown({String? ssid}) =>
      LocationClassification(
        type: LocationType.unknown,
        confidence: 0.0,
        ssid: ssid,
        timestamp: DateTime.now(),
      );

  String get displayName => customName ?? _getDefaultName();

  String _getDefaultName() {
    switch (type) {
      case LocationType.professional:
        return 'Lieu professionnel';
      case LocationType.personal:
        return 'Domicile';
      case LocationType.public:
        return 'Lieu public';
      case LocationType.transport:
        return 'Transport';
      case LocationType.unknown:
        return 'Lieu inconnu';
    }
  }
}

/// Singleton global.
final wifiTrackingService = WifiTrackingService.instance;
