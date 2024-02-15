class PostPostRegisterReq {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? role;
  String? mobile;

  PostPostRegisterReq(
      {this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.role,
      this.mobile});

  PostPostRegisterReq.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (firstname != null) {
      data['firstname'] = firstname;
    }
    if (lastname != null) {
      data['lastname'] = lastname;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (password != null) {
      data['password'] = password;
    }
    if (role != null) {
      data['role'] = role;
    }
    if (mobile != null) {
      data['mobile'] = mobile;
    }
    return data;
  }
}
