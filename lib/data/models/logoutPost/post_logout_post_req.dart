class PostLogoutPostReq {
  String? voidChar;

  PostLogoutPostReq({this.voidChar});

  PostLogoutPostReq.fromJson(Map<String, dynamic> json) {
    voidChar = json[''];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (voidChar != null) {
      data[''] = voidChar;
    }
    return data;
  }
}
