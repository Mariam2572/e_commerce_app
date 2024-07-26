import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      'Flutter is Google’s mobile UI open source framework to build high-quality native(super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
      trimLines: 2,
      trimMode: TrimMode.Line,
      style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.mainColor.withOpacity(1)),
      colorClickableText: AppColors.mainColor,
      trimLength: 20,
      trimCollapsedText: '.... Show More',
      trimExpandedText: ' Show Less',
      moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlue),
      lessStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlue),
    );
  }
}
