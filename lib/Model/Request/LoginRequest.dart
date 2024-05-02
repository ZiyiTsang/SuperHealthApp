class LoginRequest {
  String? loginId;
  String? password;

  LoginRequest({this.loginId, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    loginId = json['login_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login_id'] = this.loginId;
    data['password'] = this.password;
    return data;
  }
}