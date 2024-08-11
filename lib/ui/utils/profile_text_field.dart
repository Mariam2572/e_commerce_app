// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/ui/utils/app_color.dart';

class ProfileTextField extends StatelessWidget {
  String text;
  String hintText;
  ProfileTextField({
    Key? key,
    required this.text,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.darkBlue
          )),
          SizedBox(
            height: 10,
          ),
          TextField(
            
              decoration: InputDecoration(
                
            suffixIcon: Icon(
              Icons.edit,
              color: AppColors.greyColor,
            ),
            fillColor: AppColors.whiteColor,
            filled: true,
            focusColor: AppColors.whiteColor,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.greyColor),
            ),
          )),
        ],
      ),
    );
  }
}
