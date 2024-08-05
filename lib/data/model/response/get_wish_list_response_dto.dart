import 'package:e_commerce_app/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce_app/data/model/response/categoryorbrandsrespose_dto.dart';
import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';

class GetWishListResponseDto extends GetWishListResponseEntity {
  String? message;
  String? statusMsg;
  GetWishListResponseDto({super.status, super.count, super.data,this.message,this.statusMsg});

  GetWishListResponseDto.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => GetWishListDataDto.fromJson(e))
              .toList();
    }
  }
}

class GetWishListDataDto extends GetWishListDataEntity {
  GetWishListDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  }) : super.GetWishListDataEntity();

  GetWishListDataDto.fromJson(Map<String, dynamic> json) : super.GetWishListDataEntity() {
    if (json["sold"] is int) {
      sold = json["sold"];
    }
    if (json["images"] is List) {
      images =
          json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if (json["subcategory"] is List) {
      subcategory = json["subcategory"] == null
          ? null
          : (json["subcategory"] as List)
              .map((e) => SubcategoryDto.fromJson(e))
              .toList();
    }
    if (json["ratingsQuantity"] is int) {
      ratingsQuantity = json["ratingsQuantity"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["imageCover"] is String) {
      imageCover = json["imageCover"];
    }
    if (json["category"] is Map) {
      category = json["category"] == null
          ? null
          : CategoryOrBrandsDto.fromJson(json["category"]);
    }
    if (json["brand"] is Map) {
      brand = json["brand"] == null
          ? null
          : CategoryOrBrandsDto.fromJson(json["brand"]);
    }
    if (json["ratingsAverage"] is double) {
      ratingsAverage = json["ratingsAverage"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
  }
}
