
import 'package:e_commerce_app/data/model/response/Errors.dart';
import 'package:e_commerce_app/data/model/response/user_dto.dart';
import 'package:e_commerce_app/domain/entities/User.dart';
import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';

class RegisterResponseDto {
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Errors ? errors ;
  RegisterResponseDto({
    this.user,
    this.token,
    this.statusMsg,
        this.message,

    required this.errors,
  });

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    } 
    if(json["statusMsg"] is String) {
      message = json["statusMsg"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : UserDto.fromJson(json["user"]);
    }
     if(json["errors"] is Map) {
      errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
    } 
   
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusMsg"] = statusMsg;
    if(user != null) {
      _data["user"] = user?.toJson();
    }if(errors != null) {
      _data["errors"] = errors?.toJson();
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

