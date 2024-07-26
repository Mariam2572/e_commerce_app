import 'package:e_commerce_app/ui/home/product_details/widgets/product_count.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardAndFavItem(
      iconFavOrDel: IconButton(
        icon: Image.asset(AppImages.delete),
        onPressed: () {},
      ),
      countOrAddToCartIcon: ProductCount(),
    );
  }
}
