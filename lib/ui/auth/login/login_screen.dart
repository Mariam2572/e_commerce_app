import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/ui/utils/custom_text_field.dart';
import 'package:e_commerce_app/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController e_mailController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return 

        Scaffold(
         
          body: Container(
            color: AppColors.mainColor,
        width: double.infinity,
        height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                      key: formKey,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                          ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(
                             'welcome_back',
                              style:TextStyle(color: AppColors.whiteColor)
                              
                              
                            ),
                         ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
          
                          CustomTextFormField(
                              label:'e_mail',
                              keyboardType: TextInputType.emailAddress,
                              controller: e_mailController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'validate_mail';
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(e_mailController.text);
                                if (!emailValid) {
                                  return 'validate_mail_text';
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              label: 'password',
                              obscureText: true,
                              controller: passwordController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'validate_password';
                                }
                                if (text.length < 6) {
                                  return' password_length';
                                }
                                return null;
                              }),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                      'login',
                       
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          side: BorderSide(
                            color: AppColors.whiteColor,
                            width: 2,
                          )),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                       'or_create_account',
                      ))
                ],
              ),
            ),
          ),
       
    );
  }

 
}
