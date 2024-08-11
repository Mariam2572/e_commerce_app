// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:e_commerce_app/domain/entities/get_wish_list_response_entity.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/widget/add_to_card_in_fav.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_tab_cubit.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';

class FavoriteWidget extends StatelessWidget {
  GetWishListDataEntity wishListDataEntity;
void Function(BuildContext)? onPressed;
 void Function()  onDismissed;
  FavoriteWidget({
    Key? key,
    required this.wishListDataEntity,
   required this.onPressed,
   required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [  SlidableAction(
              onPressed:onPressed ,
              backgroundColor: AppColors.redColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
      ),
      endActionPane: ActionPane(
          // extentRatio: .25,
          motion: const  StretchMotion(),
          dismissible: DismissiblePane(onDismissed: onDismissed),
          children: [
            SlidableAction(
              onPressed:onPressed ,
              backgroundColor: AppColors.redColor,
              // foregroundColor: AppColors.whiteColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              icon: Icons.delete,
              label: 'Delete',
            )
          ]),
      child: CustomCardAndFavItem(
        title: wishListDataEntity.title ?? '',
        url: wishListDataEntity.imageCover ?? '',
        price: wishListDataEntity.price.toString(),
        countOrAddToCartIcon: InkWell(onTap: () {
          ProductTabCubit.get(context).addToCart(wishListDataEntity.id??'');
        }, child: AddToCardInFav()),
      ),
    );
  }
}
