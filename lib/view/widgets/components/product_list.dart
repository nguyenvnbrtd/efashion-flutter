import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/widgets/components/favorite_button.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant.dart';
import 'product_item_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.items}) : super(key: key);

  final List<ProductItem> items;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);

    return SizedBox(
      width: double.infinity,
      child: items.isNotEmpty
          ? Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: width * 0.05,
              children: items.map((e) => ProductItemCard(item: e)).toList(),
            )
          : Column(
              children: [
                SpaceVertical(height: width * 0.2),
                SizedBox(
                    width: width * 0.4,
                    height: width * 0.4,
                    // height: ,
                    child: Image.asset(
                      emptyImage,
                      fit: BoxFit.contain,
                      color: Colors.grey,
                    ))
              ],
            ),
    );
  }
}
