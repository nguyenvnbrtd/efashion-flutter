import 'package:efashion/view/screens/category/widgets/categoryList.dart';
import 'package:efashion/view/widgets/components/search_bar.dart';
import 'package:efashion/view/widgets/components/scroll_screen.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/material.dart';

import 'package:efashion/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/languages/eng.dart';
import '../../../model/models/category_item.dart';
import '../../../view_model/cubits/page_indicator_cubit.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    return ScrollScreen(
      child: Column(
        children: [
          SearchBar(
            label: eng['category_label'],
            iconLeft: SearchBarIcon(
                onTap: () =>
                    context.read<PageIndicatorCubit>().routeTo(homePageIndex),
                src: arrowLeftIcon),
          ),
          SpaceVertical(height: width * 0.005),
          CategoryList(items: categoriesItems),
        ],
      ),
    );
  }
}
