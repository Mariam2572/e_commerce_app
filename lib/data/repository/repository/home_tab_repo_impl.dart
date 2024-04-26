// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

class HomeTabRepoImpl implements HomeTabRepositoryContract {
  HomeTabRemoteDataSource homeTabRemoteDataSource;
  HomeTabRepoImpl({
    required this.homeTabRemoteDataSource,
  });
  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getCategory() async {
   return homeTabRemoteDataSource.getCategory();
   
  }
  
  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getBrands() {
    return homeTabRemoteDataSource.getBrands();
  }

}
