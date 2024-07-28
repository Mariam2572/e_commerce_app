import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  String text;
   ReadMoreWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      '${text}',
      trimLines: 2,
      trimMode: TrimMode.Line,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlue.withOpacity(1)),
      colorClickableText: AppColors.mainColor,
      trimLength: 20,
      trimCollapsedText: ' Show More',
      trimExpandedText: '   Show Less',
      moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.mainColor),
      lessStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.mainColor),
    );
  }
}
