class PostSignupPostResp {
  String? authToken;

  PostSignupPostResp({this.authToken});

  PostSignupPostResp.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (authToken != null) {
      data['authToken'] = authToken;
    }
    return data;
  }
}
