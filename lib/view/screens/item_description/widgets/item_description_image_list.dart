import 'package:flutter/material.dart';

import '../../../widgets/components/scroll_image_list.dart';

class ItemDescriptionImageList extends ScrollImageList<String> {
  ItemDescriptionImageList({
    Key? key,
    required List<String> items,
    required double width,
    required double height
  }) : super(
    key: key,
    items: items,
    height: height,
    width: width,
    radius: 0,
    gradientColors: [Colors.transparent, Colors.transparent]
  );

  @override
  Widget body(BuildContext context) {
    setOnItemTap((item) => {});
    return super.body(context);
  }

  @override
  Widget itemDisplayWidget(BuildContext context, String item) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(item, fit: BoxFit.contain),
    );
  }
}
