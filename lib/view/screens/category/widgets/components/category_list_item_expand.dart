import 'package:efashion/model/models/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../widgets/components/category_item_screen_tap.dart';

class CategoryListItemExpand extends StatelessWidget{
  const CategoryListItemExpand({Key? key, required this.item}) : super(key: key);
  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    return CategoryItemScreenTap(
      item: item,
      child: Container(
        height: 80,
        margin: EdgeInsets.only(bottom: width*0.05),
        padding: EdgeInsets.only(left: width*0.05),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 2),
                  blurRadius: 5,
                  color: Colors.black45.withOpacity(0.3)
              )
            ]
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(
              item.name,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),
            )),
            Image.asset(item.image),
          ],
        ),
      ),
    );
  }
}