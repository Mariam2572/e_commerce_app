
class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequest({this.name, this.email, this.password, this.rePassword, this.phone});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    if(json["rePassword"] is String) {
      rePassword = json["rePassword"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["password"] = password;
    _data["rePassword"] = rePassword;
    _data["phone"] = phone;
    return _data;
  }
}