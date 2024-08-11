import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/data_source/cart_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/data_source/get_user_info_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/data_source/home_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/data_source/wish_list_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/cart_repository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/get_user_info_repository.dart';
import 'package:e_commerce_app/data/repository/repository/home_repo_impl.dart';
import 'package:e_commerce_app/data/repository/repository/wish_list_repo_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/get_user_info_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/wish_list_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/get_user_info_repository%20copy.dart';
import 'package:e_commerce_app/domain/repository/repository/home_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/wish_list_repository.dart';
import 'package:e_commerce_app/domain/use_cases/add_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_wish_list.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_user_data_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/home_tab_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_count_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/wish_list_use_case.dart';

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

HomeRepositoryContract injectToHomeTab() {
  return HomeTabRepoImpl(
      homeTabRemoteDataSource: injectToHomeTabRemoteDataSource());
}

HomeRemoteDataSource injectToHomeTabRemoteDataSource() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AddCartUseCase injectAddCartUseCase() {
  return AddCartUseCase(homeRepositoryContract: injectToHomeTab());
}

GetCartUseCase injectToCartUseCase() {
  return GetCartUseCase(cartRepositoryContract: injectToCartRepository());
}

CartRemoteDataSource injectToCartRemoteDataSource() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

CartRepositoryContract injectToCartRepository() {
  return CartRepositoryImpl(
      cartRemoteDataSource: injectToCartRemoteDataSource());
}

DeleteCartUseCase injectDeleteCartUseCase() {
  return DeleteCartUseCase(cartRepositoryContract: injectToCartRepository());
}

UpdateCountUseCase injectUpdateCountUseCase() {
  return UpdateCountUseCase(cartRepositoryContract: injectToCartRepository());
}
AddToWishListUseCase injectAddToWishListUseCase() {
  return AddToWishListUseCase(wishListRepositoryContract: injectToWishListRepositoryContract());
}
WishListRepositoryContract injectToWishListRepositoryContract(){
  return WishListRepositoryImpl(wishListDataSource: injectWishListDataSource());
}
WishListDataSource injectWishListDataSource(){
  return WishListDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetWishListUseCase injectGetWishListUseCase(){
  return GetWishListUseCase(wishListRepositoryContract: injectToWishListRepositoryContract());
}
DeleteWishListUseCase injectDeleteWishListUseCase(){
  return DeleteWishListUseCase(wishListRepositoryContract: injectToWishListRepositoryContract());
}
GetUserInfoUseCase injectGetUserInfoUseCase(){
  return GetUserInfoUseCase(userInfoRepositoryContract: injectToUserInfoRepositoryContract());
}
UserInfoRepositoryContract injectToUserInfoRepositoryContract(){
  return GetUserInfoRepositoryImpl(userInfoDataSourceContract: injectUserInfoDataSourceContract());
}
UserInfoDataSourceContract injectUserInfoDataSourceContract(){
  return GetUserInfoDAtaSourceImpl();
}