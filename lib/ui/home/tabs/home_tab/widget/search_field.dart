import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: MediaQuery.of(context).size.width * .85,
      child: CupertinoSearchTextField(
        placeholder: 'What do you search for ?',
        itemColor: AppColors.mainColor,
        itemSize: 25.sp,
        padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: AppColors.mainColor, width: 1)),
      ),
    );
  }
}
