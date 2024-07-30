import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepositoryContract {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemFromCart(
      String productId) {
    return cartRemoteDataSource.deleteItemFromCart(productId);
  }
  
  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(int count,String productId) {
   return cartRemoteDataSource.updateCountInCart(count,productId);
  }
}
