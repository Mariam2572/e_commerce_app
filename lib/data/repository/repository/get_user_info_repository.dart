// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/get_user_info_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/get_user_info_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/get_user_info_repository%20copy.dart';

class GetUserInfoRepositoryImpl implements UserInfoRepositoryContract {
  UserInfoDataSourceContract userInfoDataSourceContract;
  GetUserInfoRepositoryImpl({
    required this.userInfoDataSourceContract,
  });
  @override
  Future<Either<Failures, GetUserInfoEntity>> getUserInfo() {
   return  userInfoDataSourceContract.getUserInfo();
    
  }
}
