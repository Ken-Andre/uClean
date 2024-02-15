class PutPutResetPasswordTokenReq {
  String? password;

  PutPutResetPasswordTokenReq({this.password});

  PutPutResetPasswordTokenReq.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (password != null) {
      data['password'] = password;
    }
    return data;
  }
}
