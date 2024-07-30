import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
    ApiManager apiManager;
CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
 var either =await apiManager.getCart();
 return either.fold((l) => Left(l), (response) => Right(response));
  }
  
  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemFromCart(
      String productId) async {
      var either= await apiManager.deleteItemFromCart(productId);
 return either.fold((l) => Left(l), (response) => Right(response));

  }
  
  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(int count,String productId) async {
   var either= await apiManager.updateCountInCart(count,productId);
   return either.fold((l) => Left(l), (response) => Right(response));
  }
}