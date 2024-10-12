import 'package:e_commerce_app/my_observer.dart';
import 'package:e_commerce_app/ui/Payment/payment_screen.dart';
import 'package:e_commerce_app/ui/Payment/stripe_keys.dart';
import 'package:e_commerce_app/ui/auth/login/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register/register_screen.dart';
import 'package:e_commerce_app/ui/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen.dart';
import 'package:e_commerce_app/ui/home/product_details/product_details.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:e_commerce_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  Stripe.publishableKey = ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp( E_commerceApp( ));
}
class E_commerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize:const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName ,
          routes: {
            SplashScreen.routeName:(context) =>  SplashScreen(),
            LoginScreen.routeName :(context) => LoginScreen(),
            RegisterScreen.routeName :(context) => const RegisterScreen(),
            HomeScreen.routName :(context) => HomeScreen(),
            ProductDetails.routeName :(context) => ProductDetails(),
            CardScreen.routeName :(context) => CardScreen(),
            PaymentScreen.routeName :(context) => PaymentScreen(),
          },
          theme: AppTheme.mainThem,
        );
      },
    );
  }
}