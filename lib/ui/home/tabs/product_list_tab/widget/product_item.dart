import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  AppImages.slider1,
                  fit: BoxFit.fill,
                  height: 170.h,
                  width: double.infinity,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Image.asset(
                    AppImages.favTabSelected,
                    height: 50,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 17.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Text(
                  '000',
                  // (.voteAverage ?? 0).toStringAsFixed(1),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'price2 581 Eg',
                  maxLines: 2,
                ),
                Image.asset(
                  AppImages.add,
                  height: 25,
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
