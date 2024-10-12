import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/api/api_constant.dart';
import 'package:e_commerce_app/ui/Payment/stripe_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  StripeServices._();
  static StripeServices instance = StripeServices._();
  Future<void> makePayment(int amount, String currency) async {
    try {
      final clientSecret = await _createPaymentIntent(amount, currency);
      if (clientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'E-commerce',
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      debugPrint('Make Payment: ${e.toString()}');
      rethrow;
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    Dio dio = Dio();
    try {
      final headers =  {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        };
        
    
      Map<String, dynamic> body = {
        'amount': _getFinalAmount(amount),
        'currency': currency
      };
      final response = await dio.post(
        ApiConstant.createPaymentIntentPath,
        data: body,
        options:
            Options(
              contentType: Headers.formUrlEncodedContentType,
            
           headers:  headers
      ));
      if (response.data != null) {
        return response.data['client_secret'];
      }
    } on Exception catch (e) {
      print(e.toString());
      rethrow;
    }
    return null;
  }

  int _getFinalAmount(int amount) {
    return (amount * 100).toInt();
  }
}
