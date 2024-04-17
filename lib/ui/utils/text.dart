// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/ui/utils/app_color.dart';

class CustomText extends StatelessWidget {
 String text;
  CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.05),
      child: Text(text,
      style: 
      Theme.of(context).textTheme.titleMedium
      
      ),
    );
  }
}
