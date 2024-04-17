import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';

class AppTheme {
 
  static ThemeData mainThem = ThemeData(
    primaryColor: AppColors.mainColor,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: AppColors.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          titleMedium: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          titleSmall: TextStyle(

          ),
          ),
          ); 
}
