
import 'package:e_commerce_app/domain/entities/add_to_wish_list_response_entity.dart';

class AddToWishListResponseDto extends AddToWishListResponseEntity{
 

  AddToWishListResponseDto({super.status, super.message, super.data});

  AddToWishListResponseDto.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : List<String>.from(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }

}