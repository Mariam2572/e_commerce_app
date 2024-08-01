import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/add_to_wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/wish_list_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/wish_list_repository.dart';

class WishListRepositoryImpl implements WishListRepositoryContract {
WishListDataSource wishListDataSource;
  WishListRepositoryImpl({required this.wishListDataSource});
  @override
  Future<Either<Failures, AddToWishListResponseEntity>> addToWishList(String productId) {
    return wishListDataSource.addToWishList(productId);
  }

  @override
  Future<Either<Failures, AddToWishListResponseEntity>> deleteItemFromWishList(String productId) {
    // TODO: implement deleteItemFromWishList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, WishListResponseEntity>> getWishList() async {
   var either= await wishListDataSource.getWishList();
   return either.fold((l) => Left(l), (r) => Right(r));
  }

}