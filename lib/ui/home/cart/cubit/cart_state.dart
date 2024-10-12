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

final class PaymentInitial extends CartStates {}
 
// final class MakingPayment extends CartStates {}

final class PaymentMade extends CartStates {
  //   GetCartResponseEntity getCartResponseEntity;

  // PaymentMade({required this.getCartResponseEntity});
}

final class PaymentFailed extends CartStates {
  final String error;
  PaymentFailed(this.error);
}
