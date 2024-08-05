import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/wish_list_repository.dart';

class AddToWishListUseCase {
WishListRepositoryContract wishListRepositoryContract;
  AddToWishListUseCase({required this.wishListRepositoryContract});
  Future<Either<Failures, WishListResponseEntity>> invoke(String productId) async {
   var either= await  wishListRepositoryContract.addToWishList(productId);
   return either.fold((l) => Left(l), (response) => Right(response));
  }
}