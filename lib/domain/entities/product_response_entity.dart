
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';

class ProductResponseEntity {
  int? results;
  List<ProductEntity>? data;
  ProductResponseEntity({this.results,  this.data});


}

class ProductEntity {
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
  

  ProductEntity({this.sold, this.images, this.subcategory, this.ratingsQuantity, 
  this.title, this.slug, this.description, this.quantity, this.price, this.imageCover,
   this.category, this.brand, this.ratingsAverage,  this.id});


}


class SubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.id, this.name, this.slug, this.category});


}

