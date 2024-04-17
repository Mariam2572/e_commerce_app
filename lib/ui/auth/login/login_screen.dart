import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/ui/utils/custom_button.dart';
import 'package:e_commerce_app/ui/utils/custom_text_field.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/dialog_utils.dart';
import 'package:e_commerce_app/ui/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
    if (state is LoginLoading) {
          DialogUtils.showLoading(context, 'Loading...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.errorMessage!,
          title:'Error' );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.authResultEntity.userEntity?.name ?? '',
              title: 'Success'
              );
        }
    },
    child: Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
                key:cubit. formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .10,
                    ),
                    Center(child: Image.asset('assets/images/logo.png')),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*.2,left: MediaQuery.of(context).size.width*.05),
                      child: Text('Welcome back !',
                          style: Theme.of(context).textTheme.titleLarge!
                          .copyWith(color: AppColors.whiteColor,fontSize: 24)),
                    ), Padding(
                      padding: EdgeInsets.only(top: 8,bottom: 10,left: MediaQuery.of(context).size.width*.05),
                      child: Text('Please sign in with your email ',
                          style:TextStyle(fontSize: 16,fontWeight: FontWeight.w200,color: AppColors.whiteColor),
                          ),
                    ),
                   
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    CustomText(text: 'E-mail'),
                    CustomTextFormField(
                        hintText: 'Enter your e-mail',
                        keyboardType: TextInputType.emailAddress,
                        controller:cubit. e_mailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'validate_mail';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(cubit.e_mailController.text);
                          if (!emailValid) {
                            return 'validate_mail_text';
                          }
                          return null;
                        }),
                        CustomText(text: 'Password'),

                    CustomTextFormField(
                        hintText: 'Enter your password',
                        obscureText: true,
                        controller:cubit. passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'validate_password';
                          }
                          if (text.length < 6) {
                            return ' password_length';
                          }
                          return null;
                        }),
                  ],
                )),
            CustomButton(
              text: 'Login',
              onClick: () {
                cubit.login();
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RegisterScreen.routeName);
                },
                child: CustomText(text: 'Don’t have an account? Create Account')
                )
          ],
        ),
      ),
    )
  ,
    );
     }
}
