import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';

abstract class WishListRepositoryContract{
  Future<Either<Failures, WishListResponseEntity>> addToWishList(String productId);
}