import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  Widget? suffixIcon;
  String? Function(String?) validator;
  CustomTextFormField({
    required this.validator,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon:suffixIcon,
          fillColor: AppColors.whiteColor,
          filled: true,
          focusColor: AppColors.whiteColor,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.whiteColor),
                  ),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
