import 'dart:async';
import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen.dart';
import 'package:e_commerce_app/ui/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';
 

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds:1 ), () async {
      await SharedPreference.init();
      String route;
      var user = SharedPreference.getData(key: 'token');
      if (user == null) {
        route = LoginScreen.routeName;
      } else {
        route = HomeScreen.routName;
      }
      Navigator.pushReplacementNamed(
          context,
          //LoginScreen.routeName
         route);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/Group 23.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
