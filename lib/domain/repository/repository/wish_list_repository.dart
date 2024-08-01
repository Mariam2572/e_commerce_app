import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/add_to_wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';

abstract class WishListRepositoryContract{
  Future<Either<Failures, AddToWishListResponseEntity>> addToWishList(String productId);
   Future<Either<Failures,WishListResponseEntity>> getWishList();
     Future<Either<Failures,AddToWishListResponseEntity>> deleteItemFromWishList(String productId);

}