import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/data_source/home_tab_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_rebository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/home_tab_repo_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';
import 'package:e_commerce_app/domain/use_cases/home_tab_use_case.dart';
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

GetAllCategoriesUseCase injectAllCategories() {
  return GetAllCategoriesUseCase(homeTabRepositoryContract: injectToHomeTab());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(homeTabRepositoryContract: injectToHomeTab());
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(homeTabRepositoryContract: injectToHomeTab());
}

HomeTabRepositoryContract injectToHomeTab() {
  return HomeTabRepoImpl(
      homeTabRemoteDataSource: injectToHomeTabRemoteDataSource());
}

HomeTabRemoteDataSource injectToHomeTabRemoteDataSource() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
