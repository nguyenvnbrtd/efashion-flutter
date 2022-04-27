import 'package:efashion/model/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../view_model/cubits/indicator_cubit.dart';
import '../screens/account/account_page.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/category/category_page.dart';
import '../screens/category_items/category_item_screen.dart';
import '../screens/home/home_page.dart';
import '../screens/home/home_screen.dart';
import '../screens/item_description/item_description_screen.dart';
import '../screens/liked/liked_page.dart';

//import your screens here

class AppRoute {

  Route? onGenerateRoute(RouteSettings routeSettings){


    switch (routeSettings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (_)=> BlocProvider.value(
              value: IndicatorCubit(),
              child: HomeScreen(),
            )//screen 1
          );
      case cartScreen:
        return MaterialPageRoute(
            builder: (_)=> const CartScreen(), //screen 2
        );
      case categoryItemsScreen:
        return MaterialPageRoute(
          builder: (_)=> CategoryItemScreen(item: routeSettings.arguments as CategoryItem), //screen 2
        );
      case itemScreen:
        return MaterialPageRoute(
          builder: (_)=> Container(), //screen 2
        );
      case itemDescriptionScreen:
        return MaterialPageRoute(
          builder: (_)=> const ItemDescriptionScreen(), //screen 2
        );
      default:
        return null;
    }
  }

}