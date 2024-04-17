
import 'package:e_commerce_app/domain/entities/User.dart';

class AuthResultEntity {
  UserEntity ? userEntity;
  String? token;
  AuthResultEntity({
    this.userEntity,
     this.token,
  });
}
