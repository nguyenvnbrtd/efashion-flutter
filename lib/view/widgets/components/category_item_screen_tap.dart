import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../model/models/category_item.dart';

class CategoryItemScreenTap extends StatelessWidget{
  const CategoryItemScreenTap({Key? key, this.child, required this.item}) : super(key: key);

  final Widget? child;
  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, categoryItemsScreen, arguments: item),
      child: child ?? Container(),
    );
  }
}