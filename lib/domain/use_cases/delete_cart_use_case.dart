import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

import '../entities/GetCartResponseEntity.dart';

class DeleteCartUseCase{
  CartRepositoryContract cartRepositoryContract;
  DeleteCartUseCase({required this.cartRepositoryContract});
Future<Either<Failures, GetCartResponseEntity>>  invoke(String productId){
   return cartRepositoryContract.deleteItemFromCart(productId);
  }
}