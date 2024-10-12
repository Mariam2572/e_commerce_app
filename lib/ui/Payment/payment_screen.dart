import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as GetCartResponseEntity;

    return Scaffold(
            appBar: AppBar(
              title: Text('Checkout'),
            ),
          //   body: BlocBuilder<PaymentCubit, PaymentState>(
          //       builder: (context, state) {
          //     return Container();
          //   }),
           );
  }
}
