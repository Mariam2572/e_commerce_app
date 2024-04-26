import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen.dart';
import 'package:e_commerce_app/ui/utils/custom_button.dart';
import 'package:e_commerce_app/ui/utils/custom_text_field.dart';
import 'package:e_commerce_app/ui/utils/dialog_utils.dart';
import 'package:e_commerce_app/ui/utils/app_color.dart';
import 'package:e_commerce_app/ui/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

RegisterCubit cubit = RegisterCubit(registerUseCase: injectRegisterUseCase());

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterLoadingStates) {
          DialogUtils.showLoading(context, 'Loading...');
        } else if (state is RegisterErrorStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.errorMsg!,
          title:'Error' );
        } else if (state is RegisterSuccessStates) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.authResultEntity.userEntity?.name ?? '',
              title: 'Success',
                posActionName: 'Ok',
            posAction: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routName);
            },
              );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
              ),
              Center(
                child: Image.asset('assets/images/logo.png'),
              ),
              Form(
                key: cubit.form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    CustomText(text: 'Full Name'),
                    CustomTextFormField(
                      hintText: ' Enter your name',
                      controller: cubit.nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                    ),
                    CustomText(text: 'E-mail Address'),
                    CustomTextFormField(
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter valid email';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(cubit.emailController.text);
                          if (!emailValid) {
                            return 'please enter valid email';
                          }
                          return null;
                        }),
                    CustomText(text: 'Enter your Password'),
                    CustomTextFormField(
                        obscureText: cubit.isObscure,
                        suffixIcon: InkWell(
                          child: cubit.isObscure ? Icon(Icons.visibility_off) :
                          Icon(Icons.visibility)
                          ,
                          onTap: () {
                            if (cubit.isObscure) {
                              cubit.isObscure = false;
                            } else {
                              cubit.isObscure = true;
                            }
                            setState(() {
                              
                            });
                          },
                        ),
                        hintText: 'password',
                        controller: cubit.passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'please enter password';
                          }
                          if (text.length < 6) {
                            return 'password length should be < 6';
                          }
                          return null;
                        }),
                    CustomText(text: 'Confirm Password'),
                    CustomTextFormField(
                        obscureText: cubit.isObscure,
                          suffixIcon: InkWell(
                          child: cubit.isObscure ? Icon(Icons.visibility_off)
                          :Icon(Icons.visibility),
                          onTap: () {
                            if (cubit.isObscure) {
                              cubit.isObscure =false;
                            } else {
                              cubit.isObscure =true;
                            }
                            setState(() {
                              
                            });
                          },
                        ),
                        hintText: 'confirm password',
                        controller: cubit.rePasswordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'confirm password';
                          }
                          if (text != cubit.passwordController.text) {
                            return "password doesn't match";
                          }
                          return null;
                        }),
                    CustomText(text: 'Mobile Number'),
                    CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        hintText: 'phone Number',
                        controller: cubit.phoneController)
                  ],
                ),
              ),
              CustomButton(
                text: 'Create Account ',
                onClick: () => cubit.register(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
