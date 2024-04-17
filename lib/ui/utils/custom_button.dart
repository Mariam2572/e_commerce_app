// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/ui/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  String text;
  void Function()? onClick;
  CustomButton({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ElevatedButton(
        onPressed: () {
          onClick?.call();
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
        ),
      ),
    );
  }
}
