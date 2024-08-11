// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/ui/utils/app_color.dart';

class SearchField extends StatefulWidget {
  void Function(String)? onChanged;
  void Function()? onTap;
  void Function()? onSuffixTap;
  TextEditingController? controller;
  SearchField({
    Key? key,
    this.onChanged,
    this.onTap,
    this.onSuffixTap,
    this.controller,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .95,
      child: CupertinoSearchTextField(
        onSuffixTap: widget.onSuffixTap,
        onTap: widget.onTap,
        controller:widget. controller,
        onChanged: widget.onChanged,
        placeholder: 'What do you search for ?',
        itemColor: AppColors.mainColor,
        itemSize: 25.sp,
        padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: AppColors.mainColor, width: 1),),
      ),
    );
  }
}
