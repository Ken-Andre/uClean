class GetGamificationPointsResp {
  int? id;
  num? createdAt;
  int? user;
  int? points;
  String? awardedAt;

  GetGamificationPointsResp({
    this.id,
    this.createdAt,
    this.user,
    this.points,
    this.awardedAt,
  });

  GetGamificationPointsResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    user = json['user'];
    points = json['points'];
    awardedAt = json['awarded_at'];
  }

  @override
  String toString() {
    return 'GetGamificationPointsResp{id: $id, createdAt: $createdAt, user: $user, points: $points, awardedAt: $awardedAt}';
  }
}
