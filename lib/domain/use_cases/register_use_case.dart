import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepository;
  RegisterUseCase({
    required this.authRepository,
  });
  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
