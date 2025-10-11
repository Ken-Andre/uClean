class GetGetAuthMeResp {
  int? id;
  String? createdAt;
  String? name;
  String? email;

  GetGetAuthMeResp({this.id, this.createdAt, this.name, this.email});

  GetGetAuthMeResp.fromJson(Map<String, dynamic> json) {
    // Handle id field - can be int or String
    if (json['id'] is int) {
      id = json['id'];
    } else if (json['id'] is String) {
      id = int.tryParse(json['id']);
    } else {
      id = null;
    }
    createdAt = json['created_at']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
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
