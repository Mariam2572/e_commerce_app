import 'package:e_commerce_app/ui/home/home_screen/cubit/home_cubit.dart';
import 'package:e_commerce_app/ui/utils/build_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'Home screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
HomeCubit cubit = HomeCubit();
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BuildBottomNavBar(
            context: context,
            selectedIndex: cubit.selectedIndex,
            onTabFunction: (index) {
              cubit.selectedIndex = index;
              setState(() {});
            },
          ),
          body: cubit.tabs[cubit.selectedIndex],
        );
      },
    );
  }
}
