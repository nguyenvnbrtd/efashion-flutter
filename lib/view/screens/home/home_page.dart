import 'package:efashion/model/models/category_item.dart';
import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/screens/home/widgets/category_list.dart';
import 'package:efashion/view/screens/home/widgets/components/circle.dart';
import 'package:efashion/view/screens/home/widgets/splash_sale_impl.dart';
import 'package:efashion/view/widgets/components/product_list.dart';
import 'package:efashion/view/screens/home/widgets/components/section_label.dart';
import 'package:efashion/view/screens/home/widgets/flash_sale.dart';
import 'package:efashion/view/widgets/components/search_bar.dart';
import 'package:efashion/view/widgets/components/favorite_button.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:efashion/view_model/cubits/indicator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:efashion/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubits/page_indicator_cubit.dart';
import '../../widgets/components/scroll_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> cgrItems = [
      categoriesItems[0],
      categoriesItems[1],
      categoriesItems[2],
      categoriesItems[3],
      categoriesItems[4],
      categoriesItems[5],
    ];

    final List<ProductItem> pdItems = [
      productItems[0],
      productItems[1],
      productItems[2],
      productItems[3],
    ];

    final List<ProductItem> featureItems = [
      productItems[0],
      productItems[1],
      productItems[2],
      productItems[3],
      productItems[4],
    ];

    double width = windowWidth(context);

    return ScrollScreen(
      child: Column(
        children: [
          SearchBar(
            iconLeft: SearchBarIcon(onTap: () {}, src: menuIcon),
            iconRight: SearchBarIcon(onTap: () {}, src: notifyIcon),
          ),
          BlocProvider<IndicatorCubit>(
            create: (_) => IndicatorCubit(),
            child: FlashSaleTmpl(items: pdItems),
          ),
          const SpaceVertical(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                SectionLabel(label: 'Categories',viewMorePress: ()=> context.read<PageIndicatorCubit>().routeTo(categoryPageIndex),),
                const SpaceVertical(height: 10),
                CategoryList(items: cgrItems),
                const SpaceVertical(),
                const SectionLabel(label: 'Features'),
                const SpaceVertical(height: 10),
                ProductList(items: featureItems),
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
          ),
        ],
      ),
    );
  }
}
