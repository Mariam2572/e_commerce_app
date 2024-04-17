import 'dart:async';
import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
    static const String routeName ='splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () { 
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset('assets/images/Group 23.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      ),
    );
  }
}