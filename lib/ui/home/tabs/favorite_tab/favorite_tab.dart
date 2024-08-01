import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/widget/fav_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatelessWidget {
  WishListCubit cubit = WishListCubit(getWishListUseCase: injectGetWishListUseCase());
  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      bloc:cubit..getWishList() ,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            foregroundColor: AppColors.mainColor,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImages.iconShopping),
              )
            ],
            centerTitle: true,
            title: Text(
              'Favorite',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: 
           
          state is WishListSuccess ?
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                    
                itemBuilder: (context, index) {
                  return FavoriteWidget(
                      wishListDataEntity: state.wishListResponseEntity.data![index],
                      );
                },
                itemCount: state.wishListResponseEntity.data!.length,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: TotalPriceWidget(
                  totalPrice: '1000',
                ),
              )
            ],
          ) :const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),)
        );
      },
    );
  }
}
