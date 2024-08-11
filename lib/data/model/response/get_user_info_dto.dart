import 'package:e_commerce_app/domain/entities/get_user_info_entity.dart';

class GetUserInfoDto extends GetUserInfoEntity {
  String ? message;
  String ? statusMsg;
  GetUserInfoDto({super.results, super.status, super.data,this.message,this.statusMsg});

  GetUserInfoDto.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => UserDataDto.fromJson(e)).toList();
    }
  }
}

class UserDataDto extends UserDataEntity {
  UserDataDto({super.id, super.name, super.details, super.phone, super.city});

  UserDataDto.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["details"] is String) {
      details = json["details"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
  }
}
