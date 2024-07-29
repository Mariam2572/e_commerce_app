import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_use_use_case.dart';
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  GetCartUseCase getCartUseCase;

  CartCubit({required this.getCartUseCase}) : super(CartCubitInitial());
  List<GetProductCartEntity> cartList = [];
  getCart() async {
    emit(CartCubitLoading());
  var either = await  getCartUseCase.invoke();
  either.fold((l) => emit( CartCubitError(errorMessage: l)), (response) {
    cartList =response.data!.products!;
    emit(CartCubitSuccess(getCartResponseEntity: response));
  });
  }
}
