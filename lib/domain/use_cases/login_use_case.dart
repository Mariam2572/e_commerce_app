// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';
import 'package:e_commerce_app/domain/entities/faliurs.dart';
import 'package:e_commerce_app/domain/rebository/rebository/auth_repository.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;
  LoginUseCase({
    required this.repositoryContract,
  });
 Future<Either<Failures, AuthResultEntity>> invoke(String email ,String password){
    return repositoryContract.login(email, password);
  }
}
