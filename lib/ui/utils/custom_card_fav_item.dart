// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';

class CustomCardAndFavItem extends StatelessWidget {
  Widget iconFavOrDel;
  Widget countOrAddToCartIcon;
  String url;
  String title;
 
  String price;
  CustomCardAndFavItem({
    required this.price,
     required this.url, 
    Key? key,
    required this.title,
   
    required this.iconFavOrDel,
    required this.countOrAddToCartIcon,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                     title,
                     overflow: TextOverflow.ellipsis,
                     maxLines: 2,
                     
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  iconFavOrDel
                ],
              ),
              SizedBox(
                height: 10.h,
              )  ,
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('EGP $price',
                      style: Theme.of(context).textTheme.titleSmall),
                  countOrAddToCartIcon
                ],
              ),
            ],
          ),
        )
      ]),
    );
  
  }
}
