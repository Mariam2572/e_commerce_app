import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceWidget extends StatelessWidget {
  String totalPrice;
   TotalPriceWidget({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Text(
          'Total price',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.greyColor),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('Egp ${totalPrice}', style: Theme.of(context).textTheme.
        titleSmall),
      ]);
  }
}