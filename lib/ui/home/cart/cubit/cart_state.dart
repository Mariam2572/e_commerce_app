part of 'cart_cubit.dart';

@immutable
sealed class CartStates {}

final class CartCubitInitial extends CartStates {}

final class CartCubitLoading extends CartStates {}

// ignore: must_be_immutable
final class CartCubitError extends CartStates {
  Failures errorMessage;
  CartCubitError({required this.errorMessage});
}

// ignore: must_be_immutable
final class CartCubitSuccess extends CartStates {
  GetCartResponseEntity getCartResponseEntity;
  CartCubitSuccess({required this.getCartResponseEntity});
}

final class PaymentMade extends CartStates {
}

final class PaymentFailed extends CartStates {
  final String error;
  PaymentFailed(this.error);
}

final class ClearCartSuccess extends CartStates {
  String ?message;
  ClearCartSuccess({ this.message});
}

final class ClearCartFailed extends CartStates {  
  String? errorMessage;
  ClearCartFailed({this.errorMessage});
}
