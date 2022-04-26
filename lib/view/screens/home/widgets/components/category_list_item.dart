import 'package:efashion/model/models/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../widgets/components/category_item_screen_tap.dart';
import '../../../../widgets/components/gradient_cover.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({Key? key, required this.item, this.margin = 0}) : super(key: key);

  final CategoryItem item;
  final double margin;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    double size = width * 0.2;

    return CategoryItemScreenTap(
      item: item,
      child: Container(
          width: size,
          height: size,
          margin: EdgeInsets.only(right: margin),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GradientCover(
                colors: const [primaryColor, Colors.black],
                opacity: 0.3,
                child: Image.asset(item.image,
                    fit: BoxFit.cover, alignment: Alignment.center),
              ),
              Container(
                width: size,
                padding: const EdgeInsets.all(5),
                child: Text(
                  item.name,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            ],
          )
      ),
    );
  }
}
