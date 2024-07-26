import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBottomNavBar extends StatelessWidget {
  BuildContext context;
  int selectedIndex;
  Function(int) onTabFunction;
  BuildBottomNavBar({
    Key? key,
    required this.context,
    required this.selectedIndex,
    required this.onTabFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      child: BottomNavigationBar(
       
          backgroundColor: AppColors.mainColor,
          type: BottomNavigationBarType.fixed,
          onTap: onTabFunction,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: CircleAvatar(
                  foregroundColor: selectedIndex == 0
                      ? AppColors.mainColor
                      : AppColors.whiteColor,
                  backgroundColor: selectedIndex == 0
                      ? AppColors.whiteColor
                      : Colors.transparent,
                  child: const ImageIcon(AssetImage(AppImages.homeTabUnS))),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: CircleAvatar(
                  foregroundColor: selectedIndex == 1
                      ? AppColors.mainColor
                      : AppColors.whiteColor,
                  backgroundColor: selectedIndex == 1
                      ? AppColors.whiteColor
                      : Colors.transparent,
                  child: const ImageIcon(
                    AssetImage(AppImages.categoryTabUnS),
                    size: 40,
                  )),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: CircleAvatar(
                foregroundColor: selectedIndex == 2
                    ? AppColors.mainColor
                    : AppColors.whiteColor,
                backgroundColor: selectedIndex == 2
                    ? AppColors.whiteColor
                    : Colors.transparent,
                child: const ImageIcon(
                  AssetImage(AppImages.favTabS),
                  size: 30,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: CircleAvatar(
                foregroundColor: selectedIndex == 3
                    ? AppColors.mainColor
                    : AppColors.whiteColor,
                backgroundColor: selectedIndex == 3
                    ? AppColors.whiteColor
                    : Colors.transparent,
                child: const ImageIcon(
                  AssetImage(AppImages.personTabUnS),
                  size: 35,
                ),
              ),
            ),
          ]),
    );
  }
}
