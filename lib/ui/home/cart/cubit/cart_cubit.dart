// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
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
  CartCubit({
    required this.getCartUseCase,
    required this.deleteCartUseCase,
    required this.updateCountUseCase,
    // required this.getCartResponseEntity,
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
    // emit(CartCubitLoading());
    var either = await deleteCartUseCase.invoke(productId);
    return either.fold((l) => emit(CartCubitError(errorMessage: l)),
        (response) => emit(CartCubitSuccess(getCartResponseEntity: response)));
  }

  updateCountInCart(int count, String productId) async {
    // emit(CartCubitLoading());
    var either = await updateCountUseCase.invoke(count, productId);
    either.fold((l) => emit(CartCubitError(errorMessage: l)),
        (response) => emit(CartCubitSuccess(getCartResponseEntity: response)));
  }

  final stripeServices = StripeServices.instance;

makePayment(int amount, String currency) async {
  // emit(CartCubitLoading());

  try {
    await stripeServices.makePayment(amount, currency);
    emit(PaymentMade());

    // بعد الدفع، نعيد تحميل الكارت للتحديث
    var either = await getCartUseCase.invoke();
    either.fold(
      (l) => emit(PaymentFailed(l.toString())),
      (r) => emit(CartCubitSuccess(getCartResponseEntity: r)),
    );
  } on StripeException catch (e) {
    emit(PaymentFailed('Payment Cancelled'));
    debugPrint('Stripe Error: ${e.error.message}');
  } on Exception catch (e) {
    emit(PaymentFailed('An unexpected error occurred: ${e.toString()}'));
    debugPrint('Payment Error: ${e.toString()}');
  }
}
}
