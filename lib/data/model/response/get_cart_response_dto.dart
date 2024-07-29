
import 'package:e_commerce_app/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce_app/data/model/response/categoryorbrandsrespose_dto.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDto extends GetCartResponseEntity{
String? message;
String? statusMsg;
  GetCartResponseDto({super.status, super.numOfCartItems, super.data,this.message,this.statusMsg});

  GetCartResponseDto.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : GetCartDataDto.fromJson(json["data"]);
    }
    if(json["message"] is Map) {
      data = json["message"] == null ? null : GetCartDataDto.fromJson(json["message"]);
    }if(json["statusMsg"] is Map) {
      data = json["statusMsg"] == null ? null : GetCartDataDto.fromJson(json["statusMsg"]);
    }
  } 

 }

class GetCartDataDto extends GetCartDataEntity{ 
  
  GetCartDataDto({super.id, super.cartOwner, super.products, super.createdAt, super.updatedAt, super.v, super.totalCartPrice});

  GetCartDataDto.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => GetProductCartDto.fromJson(e)).toList();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
    if(json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

 }

class GetProductCartDto extends GetProductCartEntity {
 
  GetProductCartDto({super.count, super.id, super.product, super.price});

  GetProductCartDto.fromJson(Map<String, dynamic> json) {
    if(json["count"] is int) {
      count = json["count"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["product"] is Map) {
      product = json["product"] == null ? null : GetProductDto.fromJson(json["product"]);
    }
    if(json["price"] is int) {
      price = json["price"];
    }
  }

 }

class GetProductDto extends GetProductEntity {
 

  GetProductDto({super.subcategory, super.id, super.title, super.quantity, super.imageCover, super.category, super.brand,
   super.ratingsAverage});

  GetProductDto.fromJson(Map<String, dynamic> json) {
    if(json["subcategory"] is List) {
      subcategory = json["subcategory"] == null ? null : (json["subcategory"] as List).map((e) => SubcategoryDto.fromJson(e)).toList();
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["imageCover"] is String) {
      imageCover = json["imageCover"];
    }
    
    if(json["brand"] is Map) {
      brand = json["brand"] == null ? null : CategoryOrBrandsDto.fromJson(json["brand"]);
    }if(json["category"] is Map) {
      brand = json["category"] == null ? null : CategoryOrBrandsDto.fromJson(json["category"]);
    }
    if(json["ratingsAverage"] is double) {
      ratingsAverage = json["ratingsAverage"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

 }


 