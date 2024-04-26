import 'package:dartz/dartz.dart';
import '../../entities/categoryorbrandsresponse_entity.dart';
import '../../entities/failures.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getCategory();
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getBrands();
}
