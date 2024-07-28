
class AddCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  AddCartEntity? data;

  AddCartResponseEntity({this.status, this.message, this.numOfCartItems, this.data});


}

class AddCartEntity {
  String? id;
  String? cartOwner;
  List<AddProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  AddCartEntity({this.id, this.cartOwner, this.products, this.createdAt, this.updatedAt, this.v, this.totalCartPrice});


}

class AddProductEntity {
  int? count;
  String? id;
  String? product;
  int? price;

  AddProductEntity({this.count, this.id, this.product, this.price});

 
}