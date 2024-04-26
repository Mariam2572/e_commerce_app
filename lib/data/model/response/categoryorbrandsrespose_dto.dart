
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';

class CategoryOrBrandsResponseDto extends CategoryOrBrandsResponseEntity {
Metadata? metadata;
 
 String? statusMsg;
 String? message ;
  CategoryOrBrandsResponseDto({super.results, this.metadata, super.data, this.message,this.statusMsg});

  CategoryOrBrandsResponseDto.fromJson(Map<String, dynamic> json) {
    if(json["results"] is int) {
      results = json["results"];
    }
    if(json["metadata"] is Map) {
      metadata = json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => CategoryOrBrandsDto.fromJson(e)).toList();
    }
    if(json["message"] is String) {
      message = json["message"];
    } 
    if(json["statusMsg"] is String) {
      message = json["statusMsg"];
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> _data = <String, dynamic>{};
  //   _data["results"] = results;
  //   if(metadata != null) {
  //     _data["metadata"] = metadata?.toJson();
  //   }
  //   if(data != null) {
  //     _data["data"] = data?.map((e) => e.toJson()).toList();
  //   }
  //   return _data;
  // }

}

class CategoryOrBrandsDto extends CategoryOrBrandsEntity {
 
  String? createdAt;
  String? updatedAt;

  CategoryOrBrandsDto({super.id, super.name, super.slug, super.image, this.createdAt, this.updatedAt});

  CategoryOrBrandsDto.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }


}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if(json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if(json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if(json["limit"] is int) {
      limit = json["limit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}