import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/add_cart_respose_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/domain/use_cases/add_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/home_tab_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_tab_state.dart';

class ProductTabCubit extends Cubit<ProductTabState> {
GetAllProductUseCase getAllProductUseCase;
AddCartUseCase addCartUseCase;
  ProductTabCubit({required this.getAllProductUseCase ,required this.addCartUseCase})
      : super(ProductTabInitial());
  static ProductTabCubit get(context) => BlocProvider.of(context);
  List<ProductEntity> productList = [];
  int numOfCartItem = 0;
  Future<void> getAllProducts() async {
    emit(ProductTabLoading());
    var either = await getAllProductUseCase.invoke();
    either.fold((l) => emit(ProductTabError(errorMessage: l)), (r) {
      productList = r.data ?? [];
      emit(
        ProductTabSuccess(productResponseEntity: r),
      );
    });
  }
  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    var either = await addCartUseCase.invoke(productId);
    either.fold((l) => emit(AddToCartError(errorMessage: l)),
        (response) {
          numOfCartItem = response.numOfCartItems!.toInt();
          print('Num of cart item : ${numOfCartItem}======== ');
          emit(AddToCartSuccess(addCartResponseEntity: response));
        });
  }
}
