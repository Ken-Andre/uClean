import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/trip.dart';
import 'gamification_service.dart';

/// Service de gestion des déplacements
class TripService {
  static const String _storageKey = 'trips_data';
  static const String _unclassifiedTripsKey = 'unclassified_trips';

  /// Récupère tous les déplacements
  Future<List<Trip>> getAllTrips() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_storageKey);

    if (data != null) {
      final List<dynamic> tripsData = json.decode(data) as List<dynamic>;
      return tripsData.map((tripData) => Trip.fromJson(tripData)).toList();
    }

    return [];
  }

  /// Récupère les déplacements non classifiés (pour swipe)
  Future<List<Trip>> getUnclassifiedTrips() async {
    final allTrips = await getAllTrips();
    return allTrips.where((trip) => trip.status == TripStatus.recorded).toList();
  }

  /// Ajoute un nouveau déplacement
  Future<Trip> addTrip({
    required DateTime startTime,
    required DateTime endTime,
    required double distance,
    String? startLocation,
    String? endLocation,
    int steps = 0,
  }) async {
    final trip = Trip(
      id: Trip.generateId(),
      startTime: startTime,
      endTime: endTime,
      distance: distance,
      type: TripType.personal, // Par défaut, sera modifié par le swipe
      status: TripStatus.recorded, // Non classifié au début
      startLocation: startLocation,
      endLocation: endLocation,
      steps: steps,
      createdAt: DateTime.now(),
    );

    final trips = await getAllTrips();
    trips.add(trip);

    await _saveTrips(trips);

    // Ajouter aux points de gamification
    await GamificationService().addPoints(GamificationService.eventTripRecorded);

    return trip;
  }

  /// Classifie un déplacement (swipe)
  Future<Trip> classifyTrip(String tripId, TripType type) async {
    final trips = await getAllTrips();
    final tripIndex = trips.indexWhere((trip) => trip.id == tripId);

    if (tripIndex != -1) {
      final updatedTrip = trips[tripIndex].copyWith(
        type: type,
        status: TripStatus.classified,
      );

      trips[tripIndex] = updatedTrip;
      await _saveTrips(trips);

      // Ajouter aux points de gamification
      await GamificationService().addPoints(GamificationService.eventTripClassified);

      return updatedTrip;
    }

    throw Exception('Trip not found');
  }

  /// Supprime un déplacement
  Future<void> deleteTrip(String tripId) async {
    final trips = await getAllTrips();
    trips.removeWhere((trip) => trip.id == tripId);
    await _saveTrips(trips);
  }

  /// Récupère les statistiques des déplacements
  Future<Map<String, dynamic>> getTripStats() async {
    final trips = await getAllTrips();
    final classifiedTrips = trips.where((trip) => trip.status == TripStatus.classified);

    final personalTrips = classifiedTrips.where((trip) => trip.type == TripType.personal);
    final professionalTrips = classifiedTrips.where((trip) => trip.type == TripType.professional);

    final totalDistance = classifiedTrips.fold(0.0, (sum, trip) => sum + (trip.distance ?? 0));
    final totalDuration = classifiedTrips.fold(0, (sum, trip) => sum + trip.durationMinutes);

    return {
      'total_trips': trips.length,
      'classified_trips': classifiedTrips.length,
      'unclassified_trips': trips.where((trip) => trip.status == TripStatus.recorded).length,
      'personal_trips': personalTrips.length,
      'professional_trips': professionalTrips.length,
      'total_distance_km': totalDistance / 1000.0,
      'total_duration_minutes': totalDuration,
      'average_distance_km': classifiedTrips.isEmpty ? 0.0 : (totalDistance / 1000.0) / classifiedTrips.length,
      'average_duration_minutes': classifiedTrips.isEmpty ? 0 : totalDuration ~/ classifiedTrips.length,
    };
  }

  /// Récupère les déplacements du mois en cours
  Future<List<Trip>> getCurrentMonthTrips() async {
    final trips = await getAllTrips();
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);

    return trips.where((trip) => trip.createdAt.isAfter(monthStart)).toList();
  }

  /// Récupère les déplacements de la semaine en cours
  Future<List<Trip>> getCurrentWeekTrips() async {
    final trips = await getAllTrips();
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));

    return trips.where((trip) => trip.createdAt.isAfter(weekStart)).toList();
  }

  /// Sauvegarde les déplacements
  Future<void> _saveTrips(List<Trip> trips) async {
    final prefs = await SharedPreferences.getInstance();
    final tripsData = trips.map((trip) => trip.toJson()).toList();
    await prefs.setString(_storageKey, json.encode(tripsData));
  }

  /// Synchronise un déplacement avec le serveur
  Future<void> syncTrip(String tripId) async {
    final trips = await getAllTrips();
    final tripIndex = trips.indexWhere((trip) => trip.id == tripId);

    if (tripIndex != -1) {
      final syncedTrip = trips[tripIndex].copyWith(
        status: TripStatus.synced,
        syncedAt: DateTime.now(),
      );

      trips[tripIndex] = syncedTrip;
      await _saveTrips(trips);
    }
  }

  /// Génère des données de test pour les déplacements non classifiés
  Future<void> generateTestTrips() async {
    final locations = [
      'Bureau Central',
      'Café du Coin',
      'Gare SNCF',
      'Centre Ville',
      'Parc Municipal',
      'Centre Commercial',
      'Université',
      'Hôpital',
    ];

    final random = Random();

    for (int i = 0; i < 5; i++) {
      final startTime = DateTime.now().subtract(Duration(
        hours: random.nextInt(48) + 1, // Entre 1h et 48h dans le passé
        minutes: random.nextInt(60),
      ));

      final durationMinutes = random.nextInt(120) + 15; // Entre 15min et 2h15
      final endTime = startTime.add(Duration(minutes: durationMinutes));

      final distance = (random.nextDouble() * 5000 + 500).toDouble(); // Entre 0.5km et 5.5km

      await addTrip(
        startTime: startTime,
        endTime: endTime,
        distance: distance,
        startLocation: locations[random.nextInt(locations.length)],
        endLocation: locations[random.nextInt(locations.length)],
        steps: random.nextInt(10000) + 1000, // Entre 1000 et 11000 pas
      );
    }
  }

  /// Nettoie les anciens déplacements (plus de 6 mois)
  Future<void> cleanupOldTrips() async {
    final trips = await getAllTrips();
    final sixMonthsAgo = DateTime.now().subtract(const Duration(days: 180));

    final recentTrips = trips.where((trip) => trip.createdAt.isAfter(sixMonthsAgo)).toList();
    await _saveTrips(recentTrips);
  }
}

/// Singleton pour l'accès global au service
final tripService = TripService();
