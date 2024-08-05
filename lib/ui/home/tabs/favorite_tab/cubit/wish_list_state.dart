part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}
final class WishListLoading extends WishListState {}
final class WishListError extends WishListState {
 final String errorMessage;
  WishListError({required this.errorMessage});
}
final class WishListSuccess extends WishListState {

  GetWishListResponseEntity wishListResponseEntity;
  WishListSuccess( { required this.wishListResponseEntity});
}
final class DeleteFromWishListSuccess extends WishListState {
  WishListResponseEntity wishListResponseEntity;
  DeleteFromWishListSuccess( { required this.wishListResponseEntity});
}
