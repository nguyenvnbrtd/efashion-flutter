import 'package:efashion/view/screens/account/account_page.dart';
import 'package:efashion/view/screens/category/category_page.dart';
import 'package:efashion/view/screens/liked/liked_page.dart';
import 'package:efashion/view/widgets/components/my_cart_button.dart';
import 'package:efashion/view_model/cubits/page_indicator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:efashion/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../base/cart_button_base_screen.dart';
import 'home_page.dart';

class HomeScreen extends CartButtonBaseScreen{

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {

    final List<Widget> listScreen = <Widget>[
      const HomePage(),
      const CategoryPage(),
      const LikedPage(),
      const AccountPage(),
      Container(),
      Container(),
    ];

    return BlocBuilder<PageIndicatorCubit, int>(
           builder: (_, state) => Scaffold(
             body: IndexedStack(
               index: state,
               children: listScreen,
             ),
             bottomNavigationBar: BottomNavigationBar(
               backgroundColor: Colors.white,
               iconSize: 25,
               elevation: 5,
               onTap: (indexSelecting) {
                 if (indexSelecting != state) {
                    context.read<PageIndicatorCubit>().routeTo(indexSelecting);
                 }
               },
               currentIndex: state,
               showSelectedLabels: false,
               showUnselectedLabels: false,
               selectedItemColor: primaryColor,
               type: BottomNavigationBarType.fixed,
               items: [
                 BottomNavigationBarItem(
                   label: "Home",
                   icon: BottomIcon(image: iconHome, isSelected: state == 0),
                 ),
                 BottomNavigationBarItem(
                     label: "Categories",
                     // icon: SizedBox(height: 50, width:  50, child: Image.asset("assets/images/launchScreen.png", color: Colors.red,)),
                     icon: BottomIcon(image: iconCategory, isSelected: state == 1,)
                 ),
                 BottomNavigationBarItem(
                   label: "Liked",
                   icon: BottomIcon(image: iconLike, isSelected: state == 2),
                 ),
                 BottomNavigationBarItem(
                   label: "Account",
                   icon: BottomIcon(image: iconUser, isSelected: state == 3),
                 ),
                 const BottomNavigationBarItem(
                   label: "",
                   icon: Text(""),
                 ),
                 const BottomNavigationBarItem(
                   label: "",
                   icon: Text(""),
                 )
               ],
             ),
           ),
        );
  }
}

class BottomIcon extends StatelessWidget{
  const BottomIcon({Key? key, required this.image, this.isSelected = false}) : super(key: key);

  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: Image.asset(image, fit: BoxFit.contain, color: isSelected ? primaryMedColor : Colors.grey),
    );
  }
}