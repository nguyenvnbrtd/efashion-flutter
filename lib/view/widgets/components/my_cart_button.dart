import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class CartButton extends StatelessWidget {
  const CartButton(
      {Key? key, required this.onPress, this.price = 0, this.item = 0})
      : super(key: key);

  final VoidCallback onPress;
  final double price;
  final int item;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double buttonWidth = width * 0.3;
    double buttonHeight = width * 0.125;

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(buttonHeight/2),
          bottomLeft: Radius.circular(buttonHeight/2),
        ),
        gradient: const LinearGradient(
          begin: Alignment(1, 0.8),
          end: Alignment(-0.8, -1),
          colors: [
            primaryLightColor,
            primaryColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black45.withOpacity(0.3),
              blurRadius: 3,
              offset: const Offset(0, 2))
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                const SpaceHorizontal(width: 3,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$ $price',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white)),
                    Text('$item items',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white)),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
