import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../utils/app_images.dart';
import '../../cart/cart_screen.dart';

class ProductListTab extends StatefulWidget {
  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  bool isEnabled = true;
  ProductTabCubit cubit = ProductTabCubit(
      addToWishListUseCase: injectAddToWishListUseCase(),
      getAllProductUseCase: injectGetAllProductUseCase(),
      addCartUseCase: injectAddCartUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabCubit>(
create: (context) => cubit..getAllProducts(),
      
      child: BlocConsumer<ProductTabCubit, ProductTabState>(
        listener: (context, state) {
          if (state is ProductTabSuccess) {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                isEnabled = false;
                setState(() {});
              },
            );
          }
        
        },
        builder: (context, state) {
          return  SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CardScreen.routeName);
                        },
                        child: Badge(
                          isLabelVisible: cubit.numOfCartItem != 0 ? true : false,
                          label: Text(
                            cubit.numOfCartItem.toString(),
                          ),
                          child: Image.asset(
                            AppImages.iconShopping,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child:  
                          Skeletonizer(
                            enabled: isEnabled,
                            child: GridView.builder(
                                itemCount: cubit.productList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 2.7,
                                  crossAxisSpacing: 16.w,
                                ),
                                itemBuilder: (context, index) {
                                  return ProductItem(
                                    productEntity: cubit.productList[index],
                                  );
                                },
                              ),
                          ),
                    ),
                  ],
                ),
              );
            
        },
      ),
    );
  }
}
