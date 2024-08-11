import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constant.dart';
import 'package:e_commerce_app/data/model/request/login_request.dart';
import 'package:e_commerce_app/data/model/request/register_request.dart';
import 'package:e_commerce_app/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce_app/data/model/response/add_cart_response_dto.dart';
import 'package:e_commerce_app/data/model/response/categoryorbrandsrespose_dto.dart';
import 'package:e_commerce_app/data/model/response/get_cart_response_dto.dart';
import 'package:e_commerce_app/data/model/response/get_user_info_dto.dart';
import 'package:e_commerce_app/data/model/response/login_response_dto.dart';
import 'package:e_commerce_app/data/model/response/register_response_dto.dart';
import 'package:e_commerce_app/data/model/response/wish_list_response_dto.dart';
import 'package:e_commerce_app/data/model/response/get_wish_list_response_dto.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/ui/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

/*
https://ecommerce.routemisr.com/api/v1/auth/signup 
 */

class ApiManager {
  // singleton
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.registerEndPoint);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone
          );
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return left(
          ServerError(
              errorMessage: registerResponse.errors != null
                  ? registerResponse.errors!.msg!
                  : registerResponse.message!),
        );
      }
    } else {
      // No Internet
      return Left(
          NetWorkError(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.loginEndPoint);
      var loginRequest = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message!));
      }
    } else {
      return Left(
          NetWorkError(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandsResponseDto>>
      getAllCategories() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.categoriesEndPoint);
      var response = await http.get(url);
      var categoryResponse =
          CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message!));
      }
    } else {
      // No internet connection
      return left(
          NetWorkError(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandsResponseDto>> getAllBrands() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.brandsEndPoint);
      var response = await http.get(url);
      var brandsResponse =
          CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandsResponse);
      } else {
        return Left(ServerError(errorMessage: brandsResponse.message!));
      }
    } else {
      // No internet connection
      return left(
          NetWorkError(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.productsEndPoint);
      var response = await http.get(url);
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message!));
      }
    } else {
      // No internet connection
      return left(
          NetWorkError(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, AddCartResponseDto>> addToCart(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.addToCartEndPoint);
      var token = SharedPreference.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var addCartResponse =
          AddCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addCartResponse.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.addToCartEndPoint);
      var token = SharedPreference.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var getCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteItemFromCart(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConstant.baseUrl, '${ApiEndpoint.addToCartEndPoint}/$productId');
      var token = SharedPreference.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var deleteItemFromCart =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromCart);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromCart.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromCart.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      int count, String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConstant.baseUrl, "${ApiEndpoint.addToCartEndPoint}/$productId");
      var token = SharedPreference.getData(key: 'token');
      var response = await http.put(url, body: {
        'count': count.toString()
      }, headers: {
        'token': token.toString(),
      });
      var updateCountInCart =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountInCart);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: updateCountInCart.message!));
      } else {
        return Left(ServerError(errorMessage: updateCountInCart.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, WishListResponseDto>> addToWishList(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConstant.baseUrl, ApiEndpoint.addToWishListEndPoint);
      var token = SharedPreference.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var addToWishListResponse =
          WishListResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToWishListResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToWishListResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToWishListResponse.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, GetWishListResponseDto>> getWishList() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiConstant.baseUrl, ApiEndpoint.addToWishListEndPoint);
      var token = SharedPreference.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var getWishListResponse =
          GetWishListResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getWishListResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getWishListResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getWishListResponse.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, WishListResponseDto>> deleteItemFromWishList(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl,
          '${ApiEndpoint.addToWishListEndPoint}/$productId');
      var token = SharedPreference.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var deleteItemFromWishList =
          WishListResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromWishList);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromWishList.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromWishList.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }

  Future<Either<Failures, GetUserInfoDto>> getUserInfo() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.addressEndPoint);
      var token = SharedPreference.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var getUserInfo = GetUserInfoDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getUserInfo);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getUserInfo.message!));
      } else {
        return Left(ServerError(errorMessage: getUserInfo.message!));
      }
    } else {
      return Left(NetWorkError(errorMessage: 'No Internet Connection'));
    }
  }
}
