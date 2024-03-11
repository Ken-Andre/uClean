class PostCreateTripResp {
  Result1? result1;

  PostCreateTripResp({this.result1});

  PostCreateTripResp.fromJson(Map<String, dynamic> json) {
    result1 =
        json['result1'] != null ? Result1.fromJson(json['result1']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result1 != null) {
      data['result1'] = result1?.toJson();
    }
    return data;
  }
}

class Result1 {
  int? id;
  int? createdAt;
  int? distance;
  String? date;
  String? meansoftransport;
  int? createdBy;
  String? pointa;
  String? pointb;
  String? tripkind;
  Startaddress? startaddress;
  Stopaddress? stopaddress;

  Result1(
      {this.id,
      this.createdAt,
      this.distance,
      this.date,
      this.meansoftransport,
      this.createdBy,
      this.pointa,
      this.pointb,
      this.tripkind,
      this.startaddress,
      this.stopaddress});

  Result1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    distance = json['distance'];
    date = json['date'];
    meansoftransport = json['meansoftransport'];
    createdBy = json['created_by'];
    pointa = json['Pointa'];
    pointb = json['Pointb'];
    tripkind = json['tripkind'];
    startaddress = json['startaddress'] != null
        ? Startaddress.fromJson(json['startaddress'])
        : null;
    stopaddress = json['stopaddress'] != null
        ? Stopaddress.fromJson(json['stopaddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (createdAt != null) {
      data['created_at'] = createdAt;
    }
    if (distance != null) {
      data['distance'] = distance;
    }
    if (date != null) {
      data['date'] = date;
    }
    if (meansoftransport != null) {
      data['meansoftransport'] = meansoftransport;
    }
    if (createdBy != null) {
      data['created_by'] = createdBy;
    }
    if (pointa != null) {
      data['Pointa'] = pointa;
    }
    if (pointb != null) {
      data['Pointb'] = pointb;
    }
    if (tripkind != null) {
      data['tripkind'] = tripkind;
    }
    if (startaddress != null) {
      data['startaddress'] = startaddress?.toJson();
    }
    if (stopaddress != null) {
      data['stopaddress'] = stopaddress?.toJson();
    }
    return data;
  }
}

class Startaddress {
  String? type;
  Data? data;

  Startaddress({this.type, this.data});

  Startaddress.fromJson(Map<String, dynamic> json) {
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
  double? lng;
  double? lat;

  Data({this.lng, this.lat});

  Data.fromJson(Map<String, dynamic> json) {
    lng = json['lng'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (lng != null) {
      data['lng'] = lng;
    }
    if (lat != null) {
      data['lat'] = lat;
    }
    return data;
  }
}

class Stopaddress {
  String? type;
  Data? data;

  Stopaddress({this.type, this.data});

  Stopaddress.fromJson(Map<String, dynamic> json) {
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
