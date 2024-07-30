import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class CartRepositoryContract {
 Future<Either<Failures,GetCartResponseEntity>> getCart();
 Future<Either<Failures,GetCartResponseEntity>> deleteItemFromCart(String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(int count,String productId);

}