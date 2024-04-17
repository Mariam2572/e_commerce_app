import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

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
              const SizedBox(width: 15,),
               Text(message,style: const TextStyle(color:AppColors.whiteColor),)],
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
      actins.add(TextButton(
          onPressed: () {
            if (posAction != null) {
              posAction.call();
            }
           //Navigator.pop(context);
          },
          child: Text(posActionName,style:  TextStyle(color:AppColors.whiteColor ),)));
    }
    if (negActionName != null) {
      actins.add(
        ElevatedButton(
          onPressed: () {
            if (negAction != null) {
              negAction.call();
            }
            Navigator.pop(context);
          },
          child: Text(negActionName)));
    }

    showDialog(

      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(25)),
          content: Text(message,style: const TextStyle(color:AppColors.whiteColor),),
          title: Text(title ?? '',style: const TextStyle(
            color: AppColors.whiteColor
          ),),
          actions: actins,
        );
      },
    );
  }
}
