import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';

abstract class HomeTabRepositoryContract {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getCategory();
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getBrands();
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
