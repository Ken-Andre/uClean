class PostLogoutPostResp {
  String? result1;
  int? id;
  // Result2? result2;

  PostLogoutPostResp({
    this.result1,
    this.id,
    // this.result2,
  });

  PostLogoutPostResp.fromJson(Map<String, dynamic> json) {
    result1 = json['result1'];
    id = json['id'];
    // result2 =
    //     json['result2'] != null ? Result2.fromJson(json['result2']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result1 != null) {
      data['result1'] = result1;
    }
    if (id != null) {
      data['id'] = id;
    }
    // if (result2 != null) {
    //   data['result2'] = result2?.toJson();
    // }
    return data;
  }
}

// class Result2 {
//   int? id;
//   int? createdAt;
//   String? name;
//   String? email;
//   String? type;
//
//   Result2({this.id, this.createdAt, this.name, this.email, this.type});
//
//   Result2.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     createdAt = json['created_at'];
//     name = json['name'];
//     email = json['email'];
//     type = json['Type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (id != null) {
//       data['id'] = id;
//     }
//     if (createdAt != null) {
//       data['created_at'] = createdAt;
//     }
//     if (name != null) {
//       data['name'] = name;
//     }
//     if (email != null) {
//       data['email'] = email;
//     }
//     if (type != null) {
//       data['Type'] = type;
//     }
//     return data;
//   }
// }
