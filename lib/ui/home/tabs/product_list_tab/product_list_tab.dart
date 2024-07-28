import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/product_details/product_details.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widget/product_item.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_images.dart';
import '../../card/card_screen.dart';

class ProductListTab extends StatelessWidget {
  ProductTabCubit cubit = ProductTabCubit(
      getAllProductUseCase: injectGetAllProductUseCase(),
      addCartUseCase: injectAddCartUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabCubit>(
      create: (context) => cubit..getAllProducts(),
      child: BlocBuilder<ProductTabCubit, ProductTabState>(
        // bloc: cubit..getAllProducts(),
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(CardScreen.routeName);
                      },
                      child: Badge(
                        label: Text(cubit.numOfCartItem.toString(),),
                        child: Image.asset(
                          AppImages.iconShopping,
                          width: 30,
                        ),
                      )),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: GridView.builder(
                      itemCount: cubit.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.7,
                        crossAxisSpacing: 16.w,
                      ),
                      itemBuilder: (context, index) {
                        return state is ProductTabLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColors.mainColor,
                              ))
                            : ProductItem(
                                productEntity: cubit.productList[index],
                              );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
