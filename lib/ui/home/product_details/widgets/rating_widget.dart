import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: must_be_immutable
class RatingWidget extends StatelessWidget {
  String ?rating;
   RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.star,color: Colors.amber,size: 15.sp,),
                    Expanded(
                      child: Text( 'Reviews ($rating)',style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.visible,
                      // maxLines: 2,
                      
                      ),
                    ),
                  ],
                ),
    );
  }
}
