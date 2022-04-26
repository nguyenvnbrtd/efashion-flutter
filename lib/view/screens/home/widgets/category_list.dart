import 'package:efashion/constant.dart';
import 'package:efashion/model/models/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/components/gradient_cover.dart';
import 'components/category_list_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.items})
      : super(key: key);

  final List<CategoryItem> items;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    double marginRight = width*0.05;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((e) => CategoryListItem(item: e, margin: e.categoryId == items.length ? 0 :marginRight)).toList(),
      ),
    );
  }
}
