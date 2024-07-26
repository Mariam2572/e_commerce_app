// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/ui/home/product_details/product_details.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';

import '../../../../utils/app_color.dart';

class ProductItem extends StatefulWidget {
  ProductEntity productList;

  ProductItem({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 300.h,
      margin: EdgeInsets.all(8),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2.7 / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        ProductDetails.routeName,
                      ),
                      child: Image.network(
                        widget.productList.imageCover ?? '',
                        fit: BoxFit.fill,
                        width: 191.w,
                        height: 128.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 3.5.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      color: AppColors.mainColor,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        isFavorite = !isFavorite;
                        setState(() {});
                      },
                      icon: isFavorite == true
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(
                              Icons.favorite_border_rounded,
                            ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.productList.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "EGP ${widget.productList.price.toString()}",
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingWidget(
                    rating: widget.productList.ratingsAverage.toString(),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      AppImages.add,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
