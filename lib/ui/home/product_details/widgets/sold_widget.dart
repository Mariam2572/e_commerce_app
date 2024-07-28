import 'package:e_commerce_app/ui/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoldWidget extends StatelessWidget {
  String sold;
   SoldWidget({super.key
   , required this.sold
   });

  @override
  Widget build(BuildContext context) {
    return   Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 7.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(
                    color: AppColors.greyColor,
                    width: 1.w
                  )
                ),
                child: Text('Sold : $sold',style: Theme.of(context).textTheme.titleSmall),
              )
             ;
  }
}