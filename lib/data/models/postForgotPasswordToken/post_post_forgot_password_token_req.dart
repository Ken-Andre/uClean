class PostPostForgotPasswordTokenReq {
  String? email;

  PostPostForgotPasswordTokenReq({this.email});

  PostPostForgotPasswordTokenReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    return data;
  }
}
