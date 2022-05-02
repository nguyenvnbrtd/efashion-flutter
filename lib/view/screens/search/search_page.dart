import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../model/languages/eng.dart';
import '../../../model/models/product_item.dart';
import '../../../model/models/product_option.dart';
import '../../widgets/components/filter_item_list.dart';
import '../../widgets/components/icon_buton.dart';
import '../../widgets/components/product_list.dart';
import '../category/widgets/categoryList.dart';

class SearchPage extends StatelessWidget{
  SearchPage({Key? key}) : super(key: key);

  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    final List<ProductItem> featureItems = [
      productItems[0],
      productItems[1],
      productItems[2],
      productItems[3],
      productItems[4],
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: windowSize.width * 0.05),
      child: Column(
        children: [
          Container(
            width: windowSize.width * 0.8,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 2.0, // soften the shadow
                    spreadRadius: 1.0,
                    //blurStyle: BlurStyle.outer,//extend the shadow
                    offset: const Offset(
                      1.0, // Move to right 10  horizontally
                      1.0, // Move to bottom 10 Vertically
                    ),
                  )
                ]),
            clipBehavior: Clip.hardEdge,
            // height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                  height: windowSize.height * 0.05,
                  child: ButtonImageIcon(
                    onTab: () {},
                    src: searchIcon,
                    iconColor: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal:  10),
                    child: TextField(
                      controller: _search,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: eng['search_hint']!,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)
                      ),
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SpaceVertical(),
          FilterSearchList<ProductOption>(items: options, onSelectedChange: (selected){}),
          const SpaceVertical(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: windowSize.width *0.05),
              child: SingleChildScrollView(
                child: ProductList(items: featureItems,),
              )
            ),
          )
        ],
      ),
    );
  }
}