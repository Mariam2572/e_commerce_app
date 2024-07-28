import 'package:e_commerce_app/domain/entities/add_cart_respose_entity.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  
  String ?statusMsg;
  AddCartResponseDto(
   
    this.statusMsg,
      {super.status, super.message, super.numOfCartItems, super.data});

  AddCartResponseDto.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : AddCartDto.fromJson(json["data"]);
    }
    
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
  }
}

class AddCartDto extends AddCartEntity {
  AddCartDto(
      {super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice});

  AddCartDto.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => ProductDto.fromJson(e))
              .toList();
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
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }
}

class ProductDto extends AddProductEntity {
  ProductDto({super.count, super.id, super.product, super.price});

  ProductDto.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is String) {
      product = json["product"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }
}
