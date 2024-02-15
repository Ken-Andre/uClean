class PutPutResetPasswordTokenResp {
  String? sId;
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  String? role;

  PutPutResetPasswordTokenResp(
      {this.sId,
      this.firstname,
      this.lastname,
      this.email,
      this.mobile,
      this.role});

  PutPutResetPasswordTokenResp.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (sId != null) {
      data['_id'] = sId;
    }
    if (firstname != null) {
      data['firstname'] = firstname;
    }
    if (lastname != null) {
      data['lastname'] = lastname;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (mobile != null) {
      data['mobile'] = mobile;
    }
    if (role != null) {
      data['role'] = role;
    }
    return data;
  }
}
