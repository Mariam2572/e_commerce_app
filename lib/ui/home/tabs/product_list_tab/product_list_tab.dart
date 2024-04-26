import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widget/product_item.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductTabCubit cubit =
      ProductTabCubit(getAllProductUseCase: injectGetAllProductUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabCubit, ProductTabState>(
      bloc: cubit..getAllProducts(),
      builder: (context, state) {
        return GridView.builder(
          itemCount: cubit.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) {
              return state is ProductTabLoading?
              const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
              :
               ProductItem(productList: cubit.productList[index],);
            });
      },
    );
  }
}
