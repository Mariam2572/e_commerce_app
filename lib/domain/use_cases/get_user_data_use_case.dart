import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/get_user_info_entity.dart';
import 'package:e_commerce_app/domain/repository/repository/get_user_info_repository%20copy.dart';

class GetUserInfoUseCase{
  UserInfoRepositoryContract userInfoRepositoryContract;
  GetUserInfoUseCase({required this.userInfoRepositoryContract});
 Future<Either<Failures, GetUserInfoEntity>> invoke(){
    return userInfoRepositoryContract.getUserInfo();
  }
}