import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/product_count.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  GetProductCartEntity cartEntity;
   CardItem({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    return CustomCardAndFavItem(
      price: cartEntity.price.toString(),
      count: cartEntity.count.toString(),
      title: cartEntity.product?.title??'',
      url: cartEntity.product?.imageCover??'',
      iconFavOrDel: IconButton(
        icon: Image.asset(AppImages.delete),
        onPressed: () {},
      ),
      countOrAddToCartIcon: ProductCount(count:  cartEntity.count.toString(),),
    );
  }
}
