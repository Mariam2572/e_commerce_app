// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/ui/utils/app_color.dart';
 
class CheckOutWidget extends StatelessWidget {
  void Function()? onTap;
  Widget child;
  CheckOutWidget({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: AppColors.mainColor),
          child: Row(
            children: [
              SizedBox(width: 10.w),
             child,
                      SizedBox(width: 10.w),
                      const Icon(
                        Icons.arrow_forward_outlined,color: AppColors.whiteColor,),
                        //  Image.asset(AppImages.arrow,),
            ],
          ),
        
      ),
    );
  }
}
