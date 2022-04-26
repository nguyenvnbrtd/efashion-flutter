import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../model/models/product_item.dart';

class FlashSaleItem extends StatelessWidget {
  const FlashSaleItem({Key? key, required this.item}) : super(key: key);

  final ProductItem item;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);

    return SizedBox(
      child: Image.asset(item.image,
          fit: BoxFit.cover, alignment: Alignment.center),
      // width: width * 0.9,
    );
  }
}
