import 'package:e_commerce_app/ui/home/card/widgets/card_item.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/total_price_widget.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardScreen extends StatelessWidget {
  static const String routeName = '/card_screen';
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        title:  Text('Card',
        
        style: Theme.of(context).textTheme.titleLarge,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: 
            ListView.builder(itemBuilder: (context, index) {
           return  CardItem(); 
            },
            itemCount: 10,
            )),
            
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
              child: TotalPriceWidget(),
            )
          ],
        ),
      );
    
  }
}