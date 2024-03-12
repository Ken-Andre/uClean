class GetGetTripsFromX8kiLetlTwmtResp {
  int? id;
  double? distance;
  String? date;
  String? meansoftransport;
  String? pointa;
  String? pointb;
  String? tripkind;

  GetGetTripsFromX8kiLetlTwmtResp({
    this.id,
    this.distance,
    this.date,
    this.meansoftransport,
    this.pointa,
    this.pointb,
    this.tripkind,
  });

  GetGetTripsFromX8kiLetlTwmtResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    distance = json['distance'];
    date = json['date'];
    meansoftransport = json['meansoftransport'];
    pointa = json['Pointa'];
    pointb = json['Pointb'];
    tripkind = json['tripkind'];
  }

  @override
  String toString() {
    return 'GetGetTripsFromX8kiLetlTwmtResp{id: $id, distance: $distance, date: $date, '
        'meansoftransport: $meansoftransport, pointa: $pointa, pointb: $pointb, tripkind: $tripkind}';
  }
}

// Map<String, dynamic> toJson() {
//   final data = <String, dynamic>{};
//   if (id != null) {
//     data['id'] = id;
//   }
//   if (distance != null) {
//     data['distance'] = distance;
//   }
//   if (date != null) {
//     data['date'] = date;
//   }
//   if (meansoftransport != null) {
//     data['meansoftransport'] = meansoftransport;
//   }
//   if (pointa != null) {
//     data['Pointa'] = pointa;
//   }
//   if (pointb != null) {
//     data['Pointb'] = pointb;
//   }
//   if (tripkind != null) {
//     data['tripkind'] = tripkind;
//   }
//   return data;
// }