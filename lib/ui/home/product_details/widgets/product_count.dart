import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_color.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
     
      // padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 7.h),
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: AppColors.greyColor, width: 1.w),
          ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              // size: 28.sp,
            ),
          ),
          Text(
            '1',
            style: Theme.of(context).textTheme.titleMedium,),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
              // size: 28.sp,
            ),
          )
        ],
      ),
    );
  }
}
