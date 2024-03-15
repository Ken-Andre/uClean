class PostCreateTripReq {
  dynamic Pointa;
  dynamic Pointb;
  int? distance;
  String? date;
  String? hour;
  String? meansoftransport;
  String? pointa;
  String? pointb;
  String? tripkind;

  PostCreateTripReq(
      {this.pointa,
      this.pointb,
      this.distance,
      this.date,
      this.hour,
      this.meansoftransport,
      this.Pointa,
      this.Pointb,
      this.tripkind});

  PostCreateTripReq.fromJson(Map<String, dynamic> json) {
    Pointa = json['Pointa'] != null ? Pointa.fromJson(json['Pointa']) : null;
    Pointb = json['Pointb'] != null ? Pointb.fromJson(json['Pointb']) : null;
    distance = json['distance'];
    date = json['date'];
    hour = json['hour'];
    meansoftransport = json['meansoftransport'];
    pointa = json['pointa'];
    pointb = json['pointb'];
    tripkind = json['tripkind'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (Pointa != null) {
      data['Pointa'] = Pointa?.toJson();
    }
    if (Pointb != null) {
      data['Pointb'] = Pointb?.toJson();
    }
    if (distance != null) {
      data['distance'] = distance;
    }
    if (date != null) {
      data['date'] = date;
    }
    if (hour != null) {
      data['hour'] = hour;
    }
    if (meansoftransport != null) {
      data['meansoftransport'] = meansoftransport;
    }
    if (pointa != null) {
      data['pointa'] = pointa;
    }
    if (pointb != null) {
      data['pointb'] = pointb;
    }
    if (tripkind != null) {
      data['tripkind'] = tripkind;
    }
    return data;
  }
}

class Pointa {
  String? type;
  Data? data;

  Pointa({this.type, this.data});

  Pointa.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? lat;
  int? lng;

  Data({this.lat, this.lng});

  Data.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (lat != null) {
      data['lat'] = lat;
    }
    if (lng != null) {
      data['lng'] = lng;
    }
    return data;
  }
}

class Pointb {
  String? type;
  Data? data;

  Pointb({this.type, this.data});

  Pointb.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}
