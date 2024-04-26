import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';
import '../entities/categoryorbrandsresponse_entity.dart';
import '../entities/failures.dart';

class GetAllCategoriesUseCase {
  HomeTabRepositoryContract homeTabRepositoryContract;
  GetAllCategoriesUseCase({
    required this.homeTabRepositoryContract,
  });
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> invoke() {
    return homeTabRepositoryContract.getCategory();
  }
}
class GetAllBrandsUseCase {
  HomeTabRepositoryContract homeTabRepositoryContract;
  GetAllBrandsUseCase({
    required this.homeTabRepositoryContract,
  });
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> invoke() {
    return homeTabRepositoryContract.getBrands();
  }
}
