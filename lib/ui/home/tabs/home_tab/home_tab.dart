import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/search/search_field.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widget/category.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widget/product_item.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/barnds.dart';
import 'widget/slider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabCubit cubit = HomeTabCubit(
    getAllCategoriesUseCase: injectAllCategories(),
    getAllBrandsUseCase: injectGetAllBrandsUseCase(),
    getAllProductUseCase: injectGetAllProductUseCase(),
  );
  bool isSearching = false;
  @override
  void dispose() {
    cubit.searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      bloc: cubit
        ..getAllCategories()
        ..getAllBrands()
        ..fetchAllProducts(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Image.asset(AppImages.logoBlue),
                SizedBox(
                  height: 15.h,
                ),
                SearchField(
                  onSuffixTap: () {
                    isSearching = false;
                    cubit.searchTextController.clear();
                    setState(() {});
                  },
                  onTap: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  controller: cubit.searchTextController,
                  onChanged: (searchText) {
                    cubit.search(searchText);
                  },
                ),
                SizedBox(height: 15.h),
                isSearching &&
                        cubit.searchTextController.text.isNotEmpty &&
                        state is SearchSuccess
                    ? Expanded(
                        child: GridView.builder(
                          itemCount: cubit.searchTextController.text.isEmpty
                              ? cubit.allProductList.length
                              : state.searchProductList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.7,
                            crossAxisSpacing: 16.w,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(
                              productEntity: state.searchProductList[index],
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
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
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'view all',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              state is HomeTabLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.mainColor,
                                      ),
                                    )
                                  : CategoryItem(
                                      categoriesList: cubit.categoriesList),
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
                              state is HomeTabLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.mainColor,
                                      ),
                                    )
                                  : Brands(brandsList: cubit.brandsLiesList),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
