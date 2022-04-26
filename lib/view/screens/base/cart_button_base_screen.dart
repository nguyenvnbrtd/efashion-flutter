import 'package:flutter/material.dart';

import '../../widgets/components/my_cart_button.dart';

abstract class CartButtonBaseScreen extends StatelessWidget{
  CartButtonBaseScreen({Key? key}) : super(key: key);

  late Size size;

  Widget body(BuildContext context){
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Stack(
      children: [
        body(context),
        Positioned(
            child: Container(
              width: size.width*0.35,
              height: 60,
              color: Colors.transparent,
            ),
            bottom: 0,
            right: 0),
        Positioned(child: CartButton(onPress: (){},), bottom: size.width*0.085, right: 0),

      ]
    );
  }
}