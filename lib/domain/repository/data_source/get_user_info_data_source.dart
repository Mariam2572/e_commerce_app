import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/get_user_info_entity.dart';

abstract class UserInfoDataSourceContract {
  Future<Either<Failures,GetUserInfoEntity>> getUserInfo();
}