import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/cubit/profile_cubit.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/dialog_utils.dart';
import 'package:e_commerce_app/ui/utils/profile_text_field.dart';
import 'package:e_commerce_app/ui/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  ProfileCubit cubit = ProfileCubit(
    getUserInfoUseCase: injectGetUserInfoUseCase(),
  );
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  DialogUtils.showMessage(
                      context: context,
                      title: 'Logout',
                      message: 'Do you want to log out?',
                      posActionName: 'Log out',
                      negActionName: 'Cancel',
                      
                      posAction: () {
                       SharedPreference.removeData(key: 'token');
Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      },
                     
                      );
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColors.mainColor,
                  size: 30.sp,
                ))
          ],
          title: Text(
            'YOUR PROFILE',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 20.h),
              child: Text(
                'WelCome, Marioma',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ProfileTextField(
              text: 'Your Full Name',
              hintText: 'Mariam Kamel',
            ),
            ProfileTextField(
              text: 'Your E-mail',
              hintText: 'mariam@kamel',
            ),
            ProfileTextField(
              text: 'Your mobile number',
              hintText: '0123456789',
            ),
            ProfileTextField(
              text: 'Your password',
              hintText: '**********',
            ),
            ProfileTextField(
              text: 'Your Address',
              hintText: '6th of october,Giza, Egypt',
            ),
          ]),
        ),
      ),
    );
  }
}
