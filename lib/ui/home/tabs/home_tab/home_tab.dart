import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widget/category.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widget/search_field.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/barnds.dart';
import 'widget/slider.dart';

class HomeTab extends StatelessWidget {
  // CategoryEntity categoryEntity;
  // HomeTab({required this.categoryEntity});
  HomeTabCubit cubit = HomeTabCubit(getAllCategoriesUseCase:injectAllCategories(),
  getAllBrandsUseCase: injectGetAllBrandsUseCase()
   );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      bloc: cubit..getAllCategories()..getAllBrands(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SearchField(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CardScreen.routeName);
                        },
                        child: Image.asset(AppImages.iconShopping)),
                    ],
                  ),
                  SliderImages(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  state is HomeTabLoading ? const Center(child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),) 
                  :
                  CategoryItem(categoriesList: cubit.categoriesList),
                  SizedBox(
                    height: 15.h,
                  ),
                   Text(
                        'Brands',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w500),
                      ),SizedBox(
                    height: 15.h,
                  ),
                   state is HomeTabLoading ? const Center(child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),) 
                  : 
                  // Text(cubit.brandsLiesList.length.toString())
                 Brands(brandsList: cubit.brandsLiesList),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
