import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_count_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  GetCartUseCase getCartUseCase;
  DeleteCartUseCase deleteCartUseCase;
  UpdateCountUseCase updateCountUseCase;

  CartCubit({required this.getCartUseCase, required this.deleteCartUseCase, required this.updateCountUseCase})
      : super(CartCubitInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<GetProductCartEntity> cartList = [];
  getCart() async {
    emit(CartCubitLoading());
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(CartCubitError(errorMessage: l)), (response) {
      cartList = response.data!.products!;
      emit(CartCubitSuccess(getCartResponseEntity: response));
    });
  }

  deleteItemFromCart(String productId) async {
    // emit(CartCubitLoading());
    var either = await deleteCartUseCase.invoke(productId);
    return either.fold((l) => emit(CartCubitError(errorMessage: l)),
        (response) => emit(CartCubitSuccess(getCartResponseEntity: response)));
  }
  updateCountInCart(int count,String productId) async {
    // emit(CartCubitLoading());
 var either =await updateCountUseCase.invoke(count,productId);
  either.fold((l) => emit(CartCubitError(errorMessage: l)), (response) => emit(CartCubitSuccess(getCartResponseEntity: response)));
  }
}
