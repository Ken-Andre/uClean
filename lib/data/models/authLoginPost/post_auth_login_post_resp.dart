import 'package:ucleankim/core/app_export.dart';

class PostAuthLoginPostResp {
  String? authToken;

  PostAuthLoginPostResp({this.authToken});

  PostAuthLoginPostResp.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    PrefUtils().setAuthToken(authToken!);
    print(
        'Login Token: ${authToken} \n and from Shared prefs \t ${PrefUtils().getAuthToken()}');
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
