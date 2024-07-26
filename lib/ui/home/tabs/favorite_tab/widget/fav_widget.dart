import 'package:e_commerce_app/ui/home/tabs/favorite_tab/widget/add_to_card_in_fav.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';
import 'package:flutter/material.dart';

import '../../../product_details/widgets/add_to_card.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardAndFavItem(
        iconFavOrDel:
            IconButton(icon: Image.asset(AppImages.favGroup), onPressed: () {}),
        countOrAddToCartIcon: InkWell(
          onTap: () {
            
          },
          child: AddToCardInFav()));
  }
}
