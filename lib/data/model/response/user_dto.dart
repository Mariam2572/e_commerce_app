import 'package:e_commerce_app/domain/entities/User.dart';

class UserDto {
  String? name;
  String? email;
  String? role;

  UserDto({this.name, this.email, this.role});

  UserDto.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["role"] = role;
    return _data;
  }
  UserEntity toUserEntity(){
    return UserEntity(email: email,name: name);
  }
}
