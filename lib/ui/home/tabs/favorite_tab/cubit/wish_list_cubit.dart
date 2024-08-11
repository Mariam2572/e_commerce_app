import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/wish_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(
      {required this.getWishListUseCase, required this.deleteWishListUseCase})
      : super(WishListInitial());
  static WishListCubit get(context) => BlocProvider.of(context);
  GetWishListUseCase getWishListUseCase;
  DeleteWishListUseCase deleteWishListUseCase;

  getWishList() async {
    emit(WishListLoading());
    var either = await getWishListUseCase.invoke();
    either.fold((l) => emit(WishListError(errorMessage: l.errorMessage)),
        (response) {
      emit(WishListSuccess(wishListResponseEntity: response));
    });
  }

  deleteItemFromWishList(String productId) async {
    var either = await deleteWishListUseCase.invoke(productId);
    either.fold((l) => emit(WishListError(errorMessage: l.errorMessage)), (r) {
      print('Delete from wish list success');
      emit(DeleteFromWishListSuccess(wishListResponseEntity: r));
    });
  }
}
