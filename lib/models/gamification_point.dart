/// Modèle représentant un point de gamification
class GamificationPoint {
  final int id;
  final DateTime createdAt;
  final int user;
  final int points;
  final DateTime awardedAt;

  const GamificationPoint({
    required this.id,
    required this.createdAt,
    required this.user,
    required this.points,
    required this.awardedAt,
  });

  /// Factory pour créer depuis JSON (réponse API)
  factory GamificationPoint.fromJson(Map<String, dynamic> json) {
    return GamificationPoint(
      id: json['id'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (json['created_at'] as num).toInt() * 1000,
      ),
      user: json['user'] as int,
      points: json['points'] as int,
      awardedAt: DateTime.parse(json['awarded_at'] as String),
    );
  }

  /// Convertir en JSON pour envoi API
  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'awarded_at':
          awardedAt.toIso8601String().split('T')[0], // Format YYYY-MM-DD
    };
  }

  /// Créer une copie avec modifications
  GamificationPoint copyWith({
    int? id,
    DateTime? createdAt,
    int? user,
    int? points,
    DateTime? awardedAt,
  }) {
    return GamificationPoint(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      user: user ?? this.user,
      points: points ?? this.points,
      awardedAt: awardedAt ?? this.awardedAt,
    );
  }

  @override
  String toString() {
    return 'GamificationPoint(id: $id, points: $points, awardedAt: $awardedAt)';
  }
}
