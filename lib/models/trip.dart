import 'dart:math';

/// Modèle de données pour les déplacements
class Trip {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final String? startLocation;
  final String? endLocation;
  final TripType type;
  final TripStatus status;
  final int? steps;
  final double? distance;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime? syncedAt;

  Trip({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.startLocation,
    required this.endLocation,
    required this.type,
    this.status = TripStatus.recorded,
    this.steps,
    this.distance,
    this.metadata,
    DateTime? createdAt,
    this.syncedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Durée du déplacement en minutes
  int get durationMinutes {
    return endTime.difference(startTime).inMinutes;
  }

  /// Distance en km
  double get distanceKm {
    return (distance ?? 0) / 1000.0;
  }

  /// Copie avec modifications
  Trip copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    String? startLocation,
    String? endLocation,
    TripType? type,
    TripStatus? status,
    int? steps,
    double? distance,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? syncedAt,
  }) {
    return Trip(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      type: type ?? this.type,
      status: status ?? this.status,
      steps: steps ?? this.steps,
      distance: distance ?? this.distance,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }

  /// Convertit en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'start_location': startLocation,
      'end_location': endLocation,
      'type': type.name,
      'status': status.name,
      'steps': steps,
      'distance': distance,
      'metadata': metadata,
      'created_at': createdAt.toIso8601String(),
      'synced_at': syncedAt?.toIso8601String(),
    };
  }

  /// Crée depuis JSON
  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] as String? ?? Trip.generateId(),
      startTime: json['start_time'] != null
          ? DateTime.parse(json['start_time'] as String)
          : DateTime.now(),
      endTime: json['end_time'] != null
          ? DateTime.parse(json['end_time'] as String)
          : DateTime.now(),
      startLocation: json['start_location'] as String?,
      endLocation: json['end_location'] as String?,
      type: json['type'] != null
          ? TripType.values.firstWhere(
              (e) => e.name == json['type'] as String,
            )
          : TripType.personal,
      status: json['status'] != null
          ? TripStatus.values.firstWhere(
              (e) => e.name == json['status'] as String,
            )
          : TripStatus.recorded,
      steps: json['steps'] as int?,
      distance: (json['distance'] as num?)?.toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      syncedAt: json['synced_at'] != null
          ? DateTime.parse(json['synced_at'] as String)
          : null,
    );
  }

  @override
  String toString() {
    return 'Trip(id: $id, type: ${type.name}, status: ${status.name})';
  }

  /// Génère un ID unique
  static String generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000).toString();
  }
}

/// Types de déplacement
enum TripType {
  personal,
  professional,
}

/// Statuts d'un déplacement
enum TripStatus {
  recorded, // Enregistré mais pas classifié
  classified, // Classifié
  synced, // Synchronisé avec le serveur
  failed, // Échec de synchronisation
}
