// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/wish_list_data_source.dart';

class WishListDataSourceImpl implements WishListDataSource {
  ApiManager apiManager;
  WishListDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, WishListResponseEntity>> addToWishList(String productId) async {
   var either = await apiManager.addToWishList(productId);
   return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, WishListResponseEntity>> deleteItemFromWishList(String productId) async {
var either = await  apiManager.deleteItemFromWishList(productId);
return either.fold((l) => left(l), (response) => Right(response));
  
  }

  @override
  Future<Either<Failures, GetWishListResponseEntity>> getWishList() async {
   var either =  await apiManager.getWishList();
   return either.fold((l) => Left(l), (r) => Right(r));
  }
}
