import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

class UpdateCountUseCase {
  CartRepositoryContract cartRepositoryContract;

  UpdateCountUseCase({required this.cartRepositoryContract});
 Future<Either<Failures, GetCartResponseEntity>> invoke(int count,String productId) async {
  var either= await  cartRepositoryContract.updateCountInCart(count,productId);
 return either.fold((l) => Left(l), (r) => Right(r));
  }
}