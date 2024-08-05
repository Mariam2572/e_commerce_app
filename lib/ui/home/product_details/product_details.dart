import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/add_to_card.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/product_count.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/read_more_widget.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/sold_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_images.dart';
import 'widgets/rating_widget.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = '/product_details';
  
   ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Image.asset(AppImages.iconShopping),
              onPressed: () {
                Navigator.pushNamed(context, CardScreen.routeName);
              },
            ),
          )
        ],
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.mainColor,
        backgroundColor: Colors.transparent,
        title: Text(
          'Product Details',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.darkBlue),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: 2.w,
                    )),
                child: ImageSlideshow(
                    isLoop: true,
                    initialPage: 0,
                    indicatorColor: AppColors.mainColor,
                    indicatorBackgroundColor: AppColors.whiteColor,
                    indicatorBottomPadding: 20.h,
                    autoPlayInterval: 3000,
                    children: args.images!.map((url) => Image.network(url,
                        fit: BoxFit.fill,
                    
                    )
                    ).toList()),
                    ),
              
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    args.title??'',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.darkBlue, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'EGP ${args.price}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SoldWidget(sold: args.sold.toString(),),
                   RatingWidget(rating: args.ratingsAverage.toString(),),
                  SizedBox(
                    width: 10.w,
                  ),
                   ProductCount(
                    addOnPressed: () {
                   
                    },
                    minusOnPressed: () {},
                    count: '1',),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Description',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.darkBlue),
              ),
              SizedBox(
                height: 20.h,
              ),
           ReadMoreWidget(text: args.description??'',),
          SizedBox(height: 150.h,),
          AddTOCartWidget(totalPrice: args.price.toString(),)
            ],
          ),
        ),
      ),
    );
  }
}
