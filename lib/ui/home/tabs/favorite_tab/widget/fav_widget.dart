// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/ui/utils/snack_bar.dart';
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
  void Function(BuildContext)? onPressedS;
  void Function() onDismissed;
  void Function() onDismissedStart;
  FavoriteWidget(
      {Key? key,
      required this.onPressedS,
      required this.wishListDataEntity,
      required this.onPressed,
      required this.onDismissed,
      required this.onDismissedStart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: StretchMotion(),
        dismissible: DismissiblePane(onDismissed: onDismissedStart),
        children: [
          SlidableAction(
            onPressed: onPressedS,
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.redColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      endActionPane: ActionPane(
          // extentRatio: .25,
          motion: const StretchMotion(),
          dismissible: DismissiblePane(onDismissed: onDismissed),
          children: [
            SlidableAction(
              onPressed: onPressed,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.redColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              icon: Icons.delete,
              label: 'Delete',
            )
          ]),
      child: CustomCardAndFavItem(
        title: wishListDataEntity.title ?? '',
        rating: wishListDataEntity.ratingsAverage.toString(),
        url: wishListDataEntity.imageCover ?? '',
        price: wishListDataEntity.price.toString(),
        countOrAddToCartIcon: InkWell(
            onTap: () {
              ProductTabCubit.get(context)
                  .addToCart(wishListDataEntity.id ?? '');
              CustomSnackBar.showSuccessSnackBar(context, 'Added To Cart');
            },
            child: const AddToCardInFav()),
      ),
    );
  }
}
