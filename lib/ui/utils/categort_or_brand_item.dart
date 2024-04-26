// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/domain/entities/categoryorbrandsresponse_entity.dart';

class CategoryOrBrandItem extends StatelessWidget {
  List<CategoryOrBrandsEntity> list;
  String url;
  String name;
  CategoryOrBrandItem({
    Key? key,
    required this.list,
    required this.url,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child:
              CircleAvatar(
            backgroundImage: NetworkImage(url),
            foregroundImage: NetworkImage(url),
            radius: 40.r,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          flex: 3,
          child: Text(name,
              maxLines: 2,
              style: TextStyle(color: AppColors.mainColor, fontSize: 14)),
        )
      ],
    );
  }
}
