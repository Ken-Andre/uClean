class GetGetAuthMeResp {
  int? id;
  int? createdAt;
  String? name;
  String? email;

  GetGetAuthMeResp({this.id, this.createdAt, this.name, this.email});

  GetGetAuthMeResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    email = json['email'];
  }

  @override
  String toString() {
    return 'GetGetAuthMeResp {id: $id, createdAt: $createdAt, name: $name,email: $email}';
  }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   if (id != null) {
  //     data['id'] = id;
  //   }
  //   if (createdAt != null) {
  //     data['created_at'] = createdAt;
  //   }
  //   if (name != null) {
  //     data['name'] = name;
  //   }
  //   if (email != null) {
  //     data['email'] = email;
  //   }
  //   return data;
  // }
}
