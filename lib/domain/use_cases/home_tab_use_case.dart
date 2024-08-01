import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository.dart';
import '../entities/categoryorbrandsresponse_entity.dart';
import '../entities/failures.dart';

class GetAllCategoriesUseCase {
  HomeRepositoryContract homeTabRepositoryContract;
  GetAllCategoriesUseCase({
    required this.homeTabRepositoryContract,
  });
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> invoke() {
    return homeTabRepositoryContract.getCategory();
  }
}

class GetAllBrandsUseCase {
  HomeRepositoryContract homeTabRepositoryContract;
  GetAllBrandsUseCase({
    required this.homeTabRepositoryContract,
  });
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> invoke() {
    return homeTabRepositoryContract.getBrands();
  }
}

class GetAllProductUseCase {
  HomeRepositoryContract homeTabRepositoryContract;
  GetAllProductUseCase({
    required this.homeTabRepositoryContract,
  });
  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeTabRepositoryContract.getProducts();
  }
}
