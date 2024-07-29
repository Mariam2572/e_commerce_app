part of 'cart_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}
final class CartCubitLoading extends CartCubitState {}
final class CartCubitError extends CartCubitState {
  Failures errorMessage;
  CartCubitError({required this.errorMessage});
}
final class CartCubitSuccess extends CartCubitState {
  GetCartResponseEntity getCartResponseEntity;
  CartCubitSuccess({required this.getCartResponseEntity});
}
