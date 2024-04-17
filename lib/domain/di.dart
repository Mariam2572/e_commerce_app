import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/rebository/data_source/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/rebository/rebository/auth_rebository_impl.dart';
import 'package:e_commerce_app/domain/rebository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/rebository/rebository/auth_repository.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';

//todo: cubit => object useCase
//todo: useCase => object repository
// todo: repository => data source
// todo: dataSource => apiManager

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepositoryContract injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepository());
}
