// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  String rating;
   RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
                children: [
                  Icon(Icons.star,color: Colors.amber,size: 20.sp,),
                  SizedBox(width: 10.w,),
                  Text('$rating',style: Theme.of(context).textTheme.titleSmall),
                ],
              );
  }
}
