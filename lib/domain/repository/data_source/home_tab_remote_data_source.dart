import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import '../../entities/categoryorbrandsresponse_entity.dart';
import '../../entities/failures.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getCategory();
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getBrands();
    Future<Either<Failures, ProductResponseEntity>> getProducts();

}
