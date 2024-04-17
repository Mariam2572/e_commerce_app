
import 'package:e_commerce_app/data/model/response/user_dto.dart';
import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';

class LoginResponseDto {
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  LoginResponseDto({this.message, this.user, this.token,this.statusMsg});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : UserDto.fromJson(json["user"]);
    }
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["statusMsg"] is String) {
      message = json["statusMsg"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusMsg"] = statusMsg;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()
    );
  }
}


