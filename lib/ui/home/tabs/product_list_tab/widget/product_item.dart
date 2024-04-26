// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';

import '../../../../utils/app_color.dart';

class ProductItem extends StatelessWidget {
  ProductEntity productList;
   ProductItem({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: AppColors.mainColor,
            width: 1.w,
          )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                   productList.imageCover??'',
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
            Text(productList.title??''),
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
                   Text(
                   productList.ratingsAverage.toString(),
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
                   Text(
                    productList.price.toString(),
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
      ),
    );
    ;
  }
}
