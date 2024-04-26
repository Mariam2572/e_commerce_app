import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderImages extends StatelessWidget {
  List<String> slideImages = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      isLoop: true,
      autoPlayInterval: 3000,
      indicatorRadius: 5.r,
      indicatorBottomPadding: 25.h,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.mainColor,
      initialPage: 0,
      children: 
      slideImages
          .map((url) => Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                  
                ),
              ))
          .toList(),
    );
  }
}
