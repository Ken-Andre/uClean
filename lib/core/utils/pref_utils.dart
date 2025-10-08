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

  bool isLoggedIn() {
    return getAuthToken().isNotEmpty;
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
