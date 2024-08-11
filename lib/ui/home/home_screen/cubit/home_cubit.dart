import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/ui/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../tabs/home_tab/home_tab.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;
    List<Widget> tabs = [
      HomeTab( ),
       ProductListTab(),
       FavoriteTab(),
       ProfileTab(),
    ];
    changBottomNavBar(int newIndex){
      emit(HomeInitial());
      selectedIndex =newIndex;
      emit(ChangBottomNavBarState());
    }
}
