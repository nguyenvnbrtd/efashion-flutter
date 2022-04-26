import 'package:efashion/model/models/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';
import 'components/category_list_item_expand.dart';

// ignore: must_be_immutable
class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.items}) : super(key: key);
  final List<CategoryItem> items;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.05),
      child: Column(
        children: items.map((e) => CategoryListItemExpand(item: e,)).toList(),
      ),
    );
  }
}
