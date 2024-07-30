import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

class GetCartUseCase{
  CartRepositoryContract cartRepositoryContract ;
  GetCartUseCase({required this.cartRepositoryContract});
Future<Either<Failures, GetCartResponseEntity>>  invoke(){
   return cartRepositoryContract.getCart();
  }
}