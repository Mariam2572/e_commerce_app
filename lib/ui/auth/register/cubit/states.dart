// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';

abstract class RegisterStates{}
class RegisterLoadingStates extends RegisterStates{}
class RegisterInitialStates extends RegisterStates{}
class RegisterErrorStates extends RegisterStates {
  String? errorMsg;
  RegisterErrorStates({
    required this.errorMsg,
  });
}
class RegisterSuccessStates extends RegisterStates {
AuthResultEntity authResultEntity;
  RegisterSuccessStates({
    required this.authResultEntity,
  });
}
