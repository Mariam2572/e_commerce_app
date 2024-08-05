import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/wish_list_repository.dart';

import '../entities/failures.dart';
import '../entities/get_wish_list_response_entity.dart';

class GetWishListUseCase {
  WishListRepositoryContract wishListRepositoryContract;

  GetWishListUseCase({required this.wishListRepositoryContract});
  Future<Either<Failures, GetWishListResponseEntity>> invoke() async {
    var either = await wishListRepositoryContract.getWishList();
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}

class DeleteWishListUseCase {
  WishListRepositoryContract wishListRepositoryContract;
  DeleteWishListUseCase({required this.wishListRepositoryContract});
  Future<Either<Failures, WishListResponseEntity>> invoke(
      String productId) async {
    var either =
        await wishListRepositoryContract.deleteItemFromWishList(productId);
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
