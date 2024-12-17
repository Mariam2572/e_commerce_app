import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/widget/fav_widget.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  WishListCubit cubit = WishListCubit(
      getWishListUseCase: injectGetWishListUseCase(),
      deleteWishListUseCase: injectDeleteWishListUseCase());

  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabCubit>(
      create: (context) => ProductTabCubit(
          addCartUseCase: injectAddCartUseCase(),
          getAllProductUseCase: injectGetAllProductUseCase(),
          addToWishListUseCase: injectAddToWishListUseCase())
        ..getAllProducts(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {
          if (state is WishListSuccess) {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                isEnabled = false;
                setState(() {});
              },
            );
          }
        },
        bloc: cubit..getWishList(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              foregroundColor: AppColors.mainColor,
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    isLabelVisible: true,
                    label: Text(
                        ProductTabCubit.get(context).numOfCartItem.toString()),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CardScreen.routeName);
                        },
                        child: Image.asset(AppImages.iconShopping)),
                  ),
                )
              ],
              centerTitle: true,
              title: Text(
                'Favorite',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: state is WishListSuccess
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: state.wishListResponseEntity.data!.isEmpty
                              ? Image.asset('assets/images/empty_screen.png')
                              : Skeletonizer(
                                  enabled: isEnabled,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return FavoriteWidget(
                                        onPressedS: (context) {
                                          cubit.deleteItemFromWishList(state
                                                  .wishListResponseEntity
                                                  .data![index]
                                                  .id ??
                                              '');
                                          cubit.getWishList();
                                        },
                                        onDismissedStart: () {
                                          cubit.deleteItemFromWishList(state
                                                  .wishListResponseEntity
                                                  .data![index]
                                                  .id ??
                                              '');
                                          cubit.getWishList();
                                        },
                                        onPressed: (context) {
                                          cubit.deleteItemFromWishList(state
                                                  .wishListResponseEntity
                                                  .data![index]
                                                  .id ??
                                              '');
                                          cubit.getWishList();
                                        },
                                        onDismissed: () {
                                          cubit.deleteItemFromWishList(state
                                                  .wishListResponseEntity
                                                  .data![index]
                                                  .id ??
                                              '');
                                          cubit.getWishList();
                                        },
                                        wishListDataEntity: state
                                            .wishListResponseEntity
                                            .data![index],
                                      );
                                    },
                                    itemCount: state
                                        .wishListResponseEntity.data!.length,
                                  ),
                                ))
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(
                          backgroundColor: AppColors.mainColor,
                        ),
                  ),
            
          );
        },
      ),
    );
  }
}
