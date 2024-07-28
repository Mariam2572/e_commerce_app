import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTOCartWidget extends StatelessWidget {
  String totalPrice;
   AddTOCartWidget({super.key , required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       TotalPriceWidget(totalPrice: totalPrice,),
      GestureDetector(
        onTap: () {},
        child: Container(
          
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.mainColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Image.asset(AppImages.iconCard),
              SizedBox(width: 10.w),
              Text('Add to cart', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500
              ))
            ],
          ),
        ),
      )
    ]);
  }
}
