import 'package:e_commerce_app/ui/auth/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/ui/utils/custom_text_field.dart';
import 'package:e_commerce_app/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'reg';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

RegisterCubit cubit = RegisterCubit();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mainColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: cubit.form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    CustomTextFormField(
                      label: ' user_name',
                      controller: cubit.nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return ' validate_user_name';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                        label: ' e_mail',
                        keyboardType: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'validate_mail';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(cubit.emailController.text);
                          if (!emailValid) {
                            return 'validate_mail_text';
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        obscureText: true,
                        label: 'password',
                        controller: cubit.passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'validate_password';
                          }
                          if (text.length < 6) {
                            return 'password_length';
                          }
                          return null;
                        }),
                    CustomTextFormField(
                        obscureText: true,
                        label: 'confirm_password',
                        controller: cubit.confirmPasswordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'confirm_password';
                          }
                          if (text != cubit.passwordController.text) {
                            return ' password_match';
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: ElevatedButton(
                  onPressed: () {
                    cubit.register();
                  },
                  child: const Text(
                    'create_account',
                  ),
                  style: ElevatedButton.styleFrom(
                    //  backgroundColor: AppColors.whiteColor,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
