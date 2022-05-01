import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../model/models/product_item.dart';
import '../../widgets/components/product_list.dart';
import '../../widgets/components/scroll_screen.dart';
import '../../widgets/components/search_bar.dart';
import '../../widgets/components/spacer.dart';
import '../home/widgets/components/circle.dart';

class LikedPage extends StatelessWidget{
  const LikedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);

    final List<ProductItem> featureItems = [
      productItems[0],
      productItems[1],
      productItems[2],
      productItems[3],
      productItems[4],
    ];



    return ScrollScreen(
      child: Column(
          children: [
            SearchBar(
              label: 'Favorite',
              iconLeft: SearchBarIcon(onTap: () {}, src: arrowLeftIcon),
              iconRight: SearchBarIcon(onTap: () {}, src: sortIcon),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width *0.05),
              child: ProductList(items: featureItems)
            ),
            const Circle(
              color: primaryColor,
              child: Circle(
                size: 2,
              ),
            ),
            SpaceVertical(
              height: width * 0.05,
            )
          ],
        ),

    );
  }

}
