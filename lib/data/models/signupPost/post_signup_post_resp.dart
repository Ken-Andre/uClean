class PostSignupPostResp {
  String? authToken;

  PostSignupPostResp({this.authToken});

  PostSignupPostResp.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    print('Signup Token: ${authToken}');

  }

  get data => null;

  Map<String, dynamic> toJson() {

    final data = <String, dynamic>{};
    if (authToken != null) {
      data['authToken'] = authToken;
    }
    return data;
  }
}
