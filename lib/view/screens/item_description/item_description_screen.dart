import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/widgets/components/scroll_screen.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class ItemDescriptionScreen extends StatelessWidget{
  const ItemDescriptionScreen({Key? key, this.item}) : super(key: key);

  final ProductItem? item;

  @override
  Widget build(BuildContext context) {
    print(item);
    return Scaffold(
      body: item != null ? ScrollScreen(
        child: Column(
          children: [

          ],
        ),
      ) : Center(
        child: Image.asset(emptyImage, color: Colors.grey),
      ),
    );
  }
}