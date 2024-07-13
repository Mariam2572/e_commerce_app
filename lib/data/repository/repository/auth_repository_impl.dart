// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
  return  remoteDataSource.register(name, email, password, rePassword, phone);
  }
  
  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password) {
   return remoteDataSource.login(email, password);
  }

}
