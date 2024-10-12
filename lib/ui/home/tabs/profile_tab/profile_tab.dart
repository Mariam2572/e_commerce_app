import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/cubit/profile_cubit.dart';
import 'package:e_commerce_app/ui/utils/app_images.dart';
import 'package:e_commerce_app/ui/utils/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  ProfileCubit cubit = ProfileCubit(getUserInfoUseCase: injectGetUserInfoUseCase(),);
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
  
        return SafeArea(
            child: SingleChildScrollView(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 20.h),
                child: Text(
                  'WelCome, Marioma',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              
              ProfileTextField(
                text: 'Your Full Name',
                hintText: 'Full Name',
              ),
              ProfileTextField(
                text: 'Your E-mail',
                hintText: 'E-mail',
              ),
              ProfileTextField(
                text: 'Your mobile number',
                hintText: 'Mobile Number',
              ),
              ProfileTextField(
                text: 'Your password',
                hintText: 'Password',
              ),
              ProfileTextField(
                text: 'Your Address',
                hintText: 'Address',
              )
            , 
            ]
          ),
        ),
        );
      
  }
}
