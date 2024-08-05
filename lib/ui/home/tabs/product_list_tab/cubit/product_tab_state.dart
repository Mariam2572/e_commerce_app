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

final class AddToCartLoading extends ProductTabState {}
final class AddToCartError extends ProductTabState {
  Failures ? errorMessage;
  AddToCartError({this.errorMessage});
}
final class AddToCartSuccess extends ProductTabState {
AddCartResponseEntity addCartResponseEntity;
AddToCartSuccess({required this.addCartResponseEntity});

}
final class AddToWishListLoading extends ProductTabState {}
final class AddToWishListError extends ProductTabState {
  Failures ? errorMessage;
  AddToWishListError({this.errorMessage});
}
final class AddToWishListSuccess extends ProductTabState {
WishListResponseEntity wishListResponseEntity;
AddToWishListSuccess({required this.wishListResponseEntity});

}
