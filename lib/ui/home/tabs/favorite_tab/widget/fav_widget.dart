// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/domain/entities/wish_list_response_entity.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/widget/add_to_card_in_fav.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';

import '../../../product_details/widgets/add_to_card.dart';

class FavoriteWidget extends StatelessWidget {
  // WishListResponseEntity wishListResponseEntity;
   FavoriteWidget({
    Key? key,
    // required this.wishListResponseEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCardAndFavItem(
  
      title: '',
      url: '',
      price: '',
        iconFavOrDel:
            IconButton(icon: Image.asset(AppImages.favGroup), onPressed: () {}),
        countOrAddToCartIcon: InkWell(
          onTap: () {
            
          },
          child: AddToCardInFav()));
  }
}
