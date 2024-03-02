class PostSignupPostReq {
  String? name;
  String? email;
  String? password;

  PostSignupPostReq({this.name, this.email, this.password});

  PostSignupPostReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (password != null) {
      data['password'] = password;
    }
    return data;
  }
}
