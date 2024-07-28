import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_cart_respose_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository.dart';

class AddCartUseCase {
  HomeRepositoryContract homeRepositoryContract;
  AddCartUseCase({required this.homeRepositoryContract});
 Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
  return  homeRepositoryContract.addToCart(productId);
  }
}