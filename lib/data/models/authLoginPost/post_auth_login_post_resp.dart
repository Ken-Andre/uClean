class PostAuthLoginPostResp {
  String? authToken;

  PostAuthLoginPostResp({this.authToken});

  PostAuthLoginPostResp.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
  }

  get data => null;

  get message => '';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (authToken != null) {
      data['authToken'] = authToken;
    }
    return data;
  }
}
