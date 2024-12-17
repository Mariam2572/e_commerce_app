import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_count_use_case.dart';
import 'package:e_commerce_app/ui/Payment/stripe_services.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteCartItemUseCase deleteCartUseCase;
  UpdateCountUseCase updateCountUseCase;
  ApiManager apiManager = ApiManager.getInstance();
  CartCubit({
    required this.getCartUseCase,
    required this.deleteCartUseCase,
    required this.updateCountUseCase,
  }) : super(CartCubitInitial());
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
    var either = await deleteCartUseCase.invoke(productId);
    return either.fold((l) => emit(CartCubitError(errorMessage: l)),
        (response) => emit(CartCubitSuccess(getCartResponseEntity: response)));
  }

  updateCountInCart(int count, String productId) async {
    var either = await updateCountUseCase.invoke(count, productId);
    either.fold((l) => emit(CartCubitError(errorMessage: l)),
        (response) => emit(CartCubitSuccess(getCartResponseEntity: response)));
  }

  final stripeServices = StripeServices.instance;

  makePayment(int amount, String currency) async {
    try {
      await stripeServices.makePayment(amount, currency);
      emit(PaymentMade());

      var either = await clearCart();

      either.fold((l) => emit(ClearCartFailed(errorMessage: l.toString())),
          (response) => emit(ClearCartSuccess(message: response.message)));
    } on StripeException catch (e) {
      emit(PaymentFailed('Payment Cancelled'));
      debugPrint('Stripe Error: ${e.error.message}');
    } on Exception catch (e) {
      emit(PaymentFailed('An unexpected error occurred: ${e.toString()}'));
      debugPrint('Payment Error: ${e.toString()}');
    }
  }

  Future<void> _handleClearCartAfterPayment() async {
    try {
      var eitherClearCart = await clearCart();

      eitherClearCart.fold(
        (l) => emit(ClearCartFailed(errorMessage: l.toString())),
        (response) async {
          emit(ClearCartSuccess(message: response.message));

          await _updateCart();
        },
      );
    } catch (e) {
      emit(ClearCartFailed(
          errorMessage: 'Failed to clear cart: ${e.toString()}'));
    }
  }

  Future<void> _updateCart() async {
    var eitherCart = await getCartUseCase.invoke();

    eitherCart.fold(
      (l) => emit(PaymentFailed(l.toString())),
      (r) => emit(CartCubitSuccess(getCartResponseEntity: r)),
    );
  }

  clearCart() async {
    emit(CartCubitLoading());
    var response = await apiManager.clearCart();
    response.fold((l) => emit(ClearCartFailed(errorMessage: l.toString())),
        (response) async {
      emit(ClearCartSuccess(message: response.message));
      var either = await getCartUseCase.invoke();
      either.fold(
        (l) => emit(ClearCartFailed(errorMessage: l.toString())),
        (r) => emit(CartCubitSuccess(getCartResponseEntity: r)),
      );
    });
  }
}
