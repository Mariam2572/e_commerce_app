import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData mainThem = ThemeData(
    primaryColor: AppColors.mainColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: AppColors.mainColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.poppins(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.poppins(
          fontSize: 14, color: AppColors.darkBlue, fontWeight: FontWeight.w500),
    ),
  );
}
