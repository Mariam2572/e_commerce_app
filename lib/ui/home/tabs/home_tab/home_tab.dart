import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/search/search_field.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widget/category.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widget/product_item.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'widget/barnds.dart';
import 'widget/slider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabCubit cubit = HomeTabCubit(
    getAllCategoriesUseCase: injectAllCategories(),
    getAllBrandsUseCase: injectGetAllBrandsUseCase(),
    getAllProductUseCase: injectGetAllProductUseCase(),
  );
  ProductTabCubit productTabCubit = ProductTabCubit(
    addCartUseCase: injectAddCartUseCase(),
    addToWishListUseCase: injectAddToWishListUseCase(),
    getAllProductUseCase: injectGetAllProductUseCase(),
  );
  bool isSearching = false;
  bool isEnabled= true;
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeTabCubit>(
          create: (context) => cubit
            ..getAllCategories()
            ..getAllBrands()
            ..fetchAllProducts(),
        ),
        
        BlocProvider<ProductTabCubit>(
          create: (context) => productTabCubit,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                Row(
                  children: [
                    SearchField(
                      onSuffixTap: () {
                        isSearching = false;
                        cubit.searchTextController.clear();
                        setState(() {});
                      
                      },
                      onTap: () {
                      
                          isSearching = true;
                      
                      },
                      controller: cubit.searchTextController,
                      onChanged: (searchText) {
                        cubit.search(searchText);
                      },
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CardScreen.routeName);
                        },
                        child: Badge(
                          label: Text(productTabCubit.numOfCartItem.toString()),
                          isLabelVisible: productTabCubit.numOfCartItem != 0 ? true : false,
                        child: Image.asset(AppImages.iconShopping))),
                  ],
                ),
                SizedBox(height: 15.h),
                BlocConsumer<HomeTabCubit, HomeTabState>(
                  listener: (context, state) {
                    if (state is HomeTabSuccess) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        (){
                          isEnabled =false;
                          setState(() {});
                        }
                      );
                    }
                  },
                  builder: (context, state) {
                   if (isSearching &&
                            cubit.searchTextController.text.isNotEmpty &&
                            state is SearchSuccess)
                        {
                          return Expanded(
                            child: GridView.builder(
                              itemCount: state.searchProductList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 2.7,
                                crossAxisSpacing: 16.w,
                              ),
                              itemBuilder: (context, index) {
                                return Skeletonizer(
                                  enabled: isEnabled,
                                  child: ProductItem(
                                    productEntity: state.searchProductList[index],
                                  ),
                                );
                              },
                            ),
                          );
                    } else {
                      return  Expanded(
                            child: SingleChildScrollView(
                              child: Skeletonizer(
                                enabled: isEnabled,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SliderImages(),
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Categories',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: AppColors.darkBlue,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'view all',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    
                                    Skeletonizer(
                                      enabled: isEnabled,
                                      child: CategoryItem(
                                          categoriesList: cubit.categoriesList),
                                    ),
                                    SizedBox(height: 15.h),
                                    Text(
                                      'Brands',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: AppColors.darkBlue,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 15.h),
                                     Skeletonizer(
                                      enabled: isEnabled,
                                       child: Brands(
                                              brandsList: cubit.brandsLiesList),
                                     )
                                  ],
                                ),
                              ),
                            ),
                          );
                   
                  }},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
