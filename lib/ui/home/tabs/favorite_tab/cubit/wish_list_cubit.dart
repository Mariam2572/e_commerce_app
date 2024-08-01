import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/wish_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
   WishListCubit({required this.getWishListUseCase}) : super(WishListInitial());
  static WishListCubit get(context) => BlocProvider.of(context);
  GetWishListUseCase getWishListUseCase;
  // List<WishListDataEntity> wishList = [];
 
  getWishList() async {
    emit(WishListLoading());
    var either = await getWishListUseCase.invoke();
    either.fold((l) => emit(WishListError(errorMessage: l.errorMessage)),
        (response) {
      // wishList = response.data !;
      emit(WishListSuccess(wishListResponseEntity: response));
      
    });
  }
}
