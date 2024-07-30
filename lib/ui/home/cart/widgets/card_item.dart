import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/ui/home/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/ui/home/product_details/widgets/product_count.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/custom_card_fav_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardItem extends StatelessWidget {
  GetProductCartEntity cartEntity;
   CardItem({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    
    return CustomCardAndFavItem(
      price: cartEntity.price.toString(),
     
      title: cartEntity.product?.title??'',
      url: cartEntity.product?.imageCover??'',
      iconFavOrDel: IconButton(
        icon: Image.asset(AppImages.delete),
        onPressed: () {
          CartCubit.get(context).deleteItemFromCart(cartEntity.product?.id??'');
        },
      ),
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
    );
  }
}
