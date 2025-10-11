//ignore: unused_import
import 'dart:convert';
// import 'dart:ui';
// import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setAuthToken(String value) {
    return _sharedPreferences!.setString('auth_token', value);
  }

  String getAuthToken() {
    try {
      return _sharedPreferences!.getString('auth_token')!;
    } catch (e) {
      return '';
    }
  }

  Future<void> setOnboardingCompleted(bool value) {
    return _sharedPreferences!.setBool('onboarding_completed', value);
  }

  bool getOnboardingCompleted() {
    try {
      return _sharedPreferences!.getBool('onboarding_completed') ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Force le logout local même si l'API échoue
  Future<void> forceLogout() async {
    await setAuthToken('');
    // Réinitialiser d'autres données utilisateur si nécessaire
  }

  bool isLoggedIn() {
    return getAuthToken().isNotEmpty;
  }

  /// Vérifie si l'utilisateur semble être connecté avec un token potentiellement valide
  bool hasValidAuthToken() {
    final token = getAuthToken();
    if (token.isEmpty) return false;

    // Vérifier si le token a une longueur raisonnable (les JWE sont généralement longs)
    if (token.length < 50) return false;

    // Vérifier si le token contient des caractères valides pour un JWE ou JWT
    // Supporte JWE (5 parties: header.encrypted_key.init_vector.ciphertext.auth_tag)
    // et JWT (3 parties: header.payload.signature)
    final tokenRegex = RegExp(
        r'^[A-Za-z0-9+/_-]+\.[A-Za-z0-9+/_-]+\.[A-Za-z0-9+/_-]+\.[A-Za-z0-9+/_-]+\.[A-Za-z0-9+/_-]{0,2}$|^[A-Za-z0-9+/_-]+\.[A-Za-z0-9+/_-]+\.[A-Za-z0-9+/_-]{0,2}$');
    return tokenRegex.hasMatch(token);
  }

  // User preference settings - Tracking
  Future<void> setStepTrackingEnabled(bool value) {
    return _sharedPreferences!.setBool('step_tracking_enabled', value);
  }

  bool getStepTrackingEnabled() {
    try {
      return _sharedPreferences!.getBool('step_tracking_enabled') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> setWifiTrackingEnabled(bool value) {
    return _sharedPreferences!.setBool('wifi_tracking_enabled', value);
  }

  bool getWifiTrackingEnabled() {
    try {
      return _sharedPreferences!.getBool('wifi_tracking_enabled') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> setOnlyTrackWithinHours(bool value) {
    return _sharedPreferences!.setBool('only_track_within_hours', value);
  }

  bool getOnlyTrackWithinHours() {
    try {
      return _sharedPreferences!.getBool('only_track_within_hours') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> setTrackingStartTime(String value) {
    return _sharedPreferences!.setString('tracking_start_time', value);
  }

  String getTrackingStartTime() {
    try {
      return _sharedPreferences!.getString('tracking_start_time') ?? '08:00';
    } catch (e) {
      return '08:00';
    }
  }

  Future<void> setTrackingEndTime(String value) {
    return _sharedPreferences!.setString('tracking_end_time', value);
  }

  String getTrackingEndTime() {
    try {
      return _sharedPreferences!.getString('tracking_end_time') ?? '18:00';
    } catch (e) {
      return '18:00';
    }
  }
}
