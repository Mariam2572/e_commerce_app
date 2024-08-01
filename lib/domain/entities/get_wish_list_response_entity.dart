
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';

class WishListResponseEntity {
  String? status;
  int? count;
  List<WishListDataEntity>? data;

  WishListResponseEntity({this.status, this.count, this.data});

 }

class WishListDataEntity {
  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryOrBrandsEntity? category;
  CategoryOrBrandsEntity? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
 

  WishListDataEntity({this.sold, this.images, this.subcategory, this.ratingsQuantity, this.id, this.title, this.slug, this.description, 
  this.quantity, this.price, this.imageCover, this.category, this.brand, this.ratingsAverage, this.createdAt, this.updatedAt, this.v});


}

