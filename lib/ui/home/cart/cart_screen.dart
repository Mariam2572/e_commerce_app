import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/ui/home/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/ui/Payment/widgets/check_out_widget.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class CardScreen extends StatefulWidget {
  static const String routeName = '/card_screen';

   CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  bool isEnabled = true;
  final cubit = CartCubit(
            updateCountUseCase: injectUpdateCountUseCase(),
            getCartUseCase: injectToCartUseCase(),
            deleteCartUseCase: injectDeleteCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => cubit..getCart(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.mainColor),
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            InkWell(
              onTap: (){
               cubit.clearCart();
              
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Image.asset(AppImages.delete),
              ),)
          ],
        ),
        body: BlocConsumer<CartCubit, CartStates>(
          listener: (context, state) {
            if (state is CartCubitSuccess) {
              Future.delayed(
              const Duration(seconds: 1),
              () {
                isEnabled = false;
                setState(() {});
              },
            );
          
            }
            if (state is PaymentMade) {
              CustomSnackBar.showSuccessSnackBar(context, 'Payment Successful!');
              cubit.clearCart();
            } else if (state is PaymentFailed) {
              CustomSnackBar.showErrorSnackBar(context, 'Payment Cancelled!');
              context.read<CartCubit>().getCart();
            }
          },
          builder: (context, state) {
            if (state is CartCubitSuccess) {
              return Skeletonizer(
                enabled: isEnabled,
                child: Column(
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
                              CustomSnackBar.showErrorSnackBar(context, 'Cart is empty');
                             
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
                ),
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
