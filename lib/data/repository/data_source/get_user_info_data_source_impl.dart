import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/get_user_info_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/get_user_info_data_source.dart';

class GetUserInfoDAtaSourceImpl implements UserInfoDataSourceContract {
  @override
  Future<Either<Failures, GetUserInfoEntity>> getUserInfo() async {
  var either = await ApiManager.getInstance().getUserInfo();
  return either.fold((l) => Left(l), (response) => Right(response));

  }
  
}