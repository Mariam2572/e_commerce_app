import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/ui/home/cart/widgets/card_item.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardScreen extends StatelessWidget {
  static const String routeName = '/card_screen';
  CartCubit cubit = CartCubit(getCartUseCase: injectToCartUseCase());

  CardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartCubitState>(
      bloc: cubit..getCart(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.mainColor),
            title: Text(
              'Card',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: state is CartCubitSuccess ? 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return  CardItem(cartEntity: state.getCartResponseEntity.data!.products![index],);
                },
                itemCount: state.getCartResponseEntity.data!.products!.length,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: TotalPriceWidget(
                  totalPrice: state.getCartResponseEntity.data!.totalCartPrice.toString(),
                ),
              )
            ],
          )
          :const Center(child:  CircularProgressIndicator(color: AppColors.mainColor,),)
        );
      },
    );
  }
}
