// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_cart_respose_entity.dart';

import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository.dart';

class HomeTabRepoImpl implements HomeRepositoryContract {
  HomeRemoteDataSource homeTabRemoteDataSource;
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

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return homeTabRemoteDataSource.getProducts();
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
   return homeTabRemoteDataSource.addToCart(productId);
  }

}
