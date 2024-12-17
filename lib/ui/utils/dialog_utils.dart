import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.mainColor,
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  message,
                  style: const TextStyle(color: AppColors.whiteColor),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      String? posActionName,
      Function? posAction,
      String? negActionName,
      Function? negAction}) {
    List<Widget> actins = [];
    if (posActionName != null) {
      actins.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            if (posAction != null) {
              posAction.call();
            }
            //Navigator.pop(context);
          },
          child: Text(
            posActionName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.mainColor
            )
          ),
        ),
      );
    }
    if (negActionName != null) {
      actins.add(ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            if (negAction != null) {
              negAction.call();
            }
            Navigator.pop(context);
          },
          child: Text(negActionName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.mainColor
          ))));
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          title: Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 22.sp,

            ),
          ),
          actions: actins,
        );
      },
    );
  }
}
