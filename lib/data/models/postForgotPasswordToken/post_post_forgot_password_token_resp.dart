class PostPostForgotPasswordTokenResp {
  String? token;

  PostPostForgotPasswordTokenResp({this.token});

  PostPostForgotPasswordTokenResp.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token;
    }
    return data;
  }
}
