import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCardInFav extends StatelessWidget {
  const AddToCardInFav({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.mainColor),
          child: Row(
            children: [
        
              // SizedBox(width: 10.w),
              Text('Add to cart',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w500,color: AppColors.whiteColor))
            ],
          ),
        )
      ;
  }
}