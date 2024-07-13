part of 'product_tab_cubit.dart';

@immutable
sealed class ProductTabState {}

final class ProductTabInitial extends ProductTabState {}
final class ProductTabLoading extends ProductTabState {}
final class ProductTabError extends ProductTabState {
  Failures ? errorMessage;
  ProductTabError({this.errorMessage});
}
final class ProductTabSuccess extends ProductTabState {
ProductResponseEntity productResponseEntity;
ProductTabSuccess({required this.productResponseEntity});
}
