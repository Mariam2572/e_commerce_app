import 'package:e_commerce_app/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/read_more_widget.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/sold_widget.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_images.dart';
import 'widgets/rating_widget.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = '/product_details';

  ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> slidingAnimation;

  late Animation<Offset> slidingAnimation2;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero)
            .animate(animationController);
    slidingAnimation2 =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
              SlideTransition(
                position: slidingAnimation,
                child: Container(
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
                      children: args.images!
                          .map((url) => Image.network(
                                url,
                                fit: BoxFit.fill,
                              ))
                          .toList()),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      args.title ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500),
                    ),
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
                children: [
                  SoldWidget(
                    sold: args.sold.toString(),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  RatingWidget(
                    rating: args.ratingsAverage.toString(),
                  ),
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
              SlideTransition(
                position: slidingAnimation2,
                child: ReadMoreWidget(
                  text: args.description ?? '',
                ),
              ),
              SizedBox(
                height: 150.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TotalPriceWidget(totalPrice: args.price.toString(),),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
