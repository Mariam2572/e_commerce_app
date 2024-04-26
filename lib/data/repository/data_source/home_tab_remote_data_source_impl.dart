import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import '../../../domain/repository/data_source/home_tab_remote_data_source.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  ApiManager apiManager;
  HomeTabRemoteDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getCategory() async {
    var either = await apiManager.getAllCategories();
    return either.fold((l) => Left(l), (r) => Right(r));
  }
  
  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getBrands() async {
   var either=  await apiManager.getAllBrands();
   return either.fold((l) => Left(l), (r) => Right(r));
  }
}
