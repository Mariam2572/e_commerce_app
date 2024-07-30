import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/wish_list_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/wish_list_repository.dart';

class WishListRepositoryImpl implements WishListRepositoryContract {
WishListDataSource wishListDataSource;
  WishListRepositoryImpl({required this.wishListDataSource});
  @override
  Future<Either<Failures, WishListResponseEntity>> addToWishList(String productId) {
    return wishListDataSource.addToWishList(productId);
  }

}