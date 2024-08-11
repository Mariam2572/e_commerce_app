import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/ui/home/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/product_count.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardItem extends StatelessWidget {
  GetProductCartEntity cartEntity;
   CardItem({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    
    return Slidable(
      
      key: UniqueKey(),
      
      endActionPane:
          ActionPane(
            extentRatio: .25, 
            motion: const StretchMotion(),
            dismissible: DismissiblePane(onDismissed: () {
              CartCubit.get(context).deleteItemFromCart(cartEntity.product?.id??'');
            }),
           children: [
        SlidableAction(
          onPressed: (context) {
CartCubit.get(context).deleteItemFromCart(cartEntity.product?.id??'');
          },
          backgroundColor: AppColors.redColor,
          foregroundColor: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10)
             ),
          icon: Icons.delete,
          label: 'Delete',
        )
      ]),
      child:
    
    CustomCardAndFavItem(
      price: cartEntity.price.toString(),
     
      title: cartEntity.product?.title??'',
      url: cartEntity.product?.imageCover??'',
    
      countOrAddToCartIcon: ProductCount(count:  cartEntity.count.toString(),
      addOnPressed: (){
        int counter = cartEntity.count!.toInt();
        counter++;
        CartCubit.get(context).updateCountInCart(counter,cartEntity.product?.id??'');
      },
      minusOnPressed: (){
        int counter =cartEntity.count!.toInt();
        counter--;
        CartCubit.get(context).updateCountInCart(counter,cartEntity.product?.id??'');
      },
      ),
    ));
  }
}
