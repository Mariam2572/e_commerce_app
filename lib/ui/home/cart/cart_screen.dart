import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/ui/home/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/ui/Payment/widgets/check_out_widget.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CardScreen extends StatelessWidget {
  static const String routeName = '/card_screen';
  const CardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) {
        final cubit = CartCubit(
            updateCountUseCase: injectUpdateCountUseCase(),
            getCartUseCase: injectToCartUseCase(),
            deleteCartUseCase: injectDeleteCartUseCase());
        cubit.getCart();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.mainColor),
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: BlocConsumer<CartCubit, CartStates>(
          listener: (context, state) {
            if (state is PaymentMade) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment successful!'),
                  backgroundColor: Colors.green,
                ),
              );
              context.read<CartCubit>().getCart();
            } else if (state is PaymentFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
              context.read<CartCubit>().getCart();
            }
          },
          builder: (context, state) {
            if (state is CartCubitSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: state.getCartResponseEntity.data!.products!.isEmpty
                        ? Image.asset('assets/images/empty_screen.png')
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return CardItem(
                                cartEntity: state.getCartResponseEntity.data!
                                    .products![index],
                              );
                            },
                            itemCount: state.getCartResponseEntity.data
                                    ?.products?.length ??
                                0,
                          ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 30.h),
                        child: TotalPriceWidget(
                          totalPrice: state
                                  .getCartResponseEntity.data?.totalCartPrice
                                  .toString() ??
                              '0',
                        ),
                      ),
                      CheckOutWidget(
                        onTap: () {
                          
                          if (state.getCartResponseEntity.data?.totalCartPrice ==0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cart is empty!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                           
                          } else {
                            context.read<CartCubit>().makePayment(
                                  state.getCartResponseEntity.data
                                          ?.totalCartPrice
                                          ?.toInt() ??
                                      0,
                                  'EGP',
                                );
                          }
                        },
                        child: Text(
                          'Checkout',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is CartCubitError) {
              return Center(
                child: Text('Error: ${state.errorMessage}'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            );
          },
        ),
      ),
    );
  }
}
