// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';

class CustomCardAndFavItem extends StatelessWidget {
  
  Widget countOrAddToCartIcon;
  String url;
  String title;
  
  String price;
  CustomCardAndFavItem({
    Key? key,
    required this.countOrAddToCartIcon,
    required this.url,
    required this.title,
  
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      clipBehavior: Clip.antiAlias,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: AppColors.mainColor.withOpacity(.5), width: 1),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                   title,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              )  ,
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('EGP $price',
                        style: Theme.of(context).textTheme.titleSmall),
                    countOrAddToCartIcon
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  
  }
}
