import 'package:efashion/model/models/category_item.dart';
import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/screens/base/cart_button_base_screen.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:efashion/view_model/blocs/product_item_list/product_item_list_event.dart';
import 'package:efashion/view_model/blocs/product_item_list/product_item_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../model/models/product_option.dart';
import '../../../view_model/blocs/product_item_list/product_item_list_bloc.dart';
import '../../widgets/components/filter_item_list.dart';
import '../../widgets/components/product_list.dart';
import '../../widgets/components/scroll_screen.dart';
import '../../widgets/components/search_bar.dart';
import '../home/widgets/components/circle.dart';

class CategoryItemScreen extends CartButtonBaseScreen {
  CategoryItemScreen({Key? key, required this.item}) : super(key: key);

  final CategoryItem item;

  @override
  Widget body(BuildContext context) {
    double width = windowWidth(context);

    final List<ProductItem> items = productItems.where((element) => element.categoryId == item.categoryId).toList();

    return BlocProvider<ProductItemListBloc>(
      create: (context) => ProductItemListBloc(items),
      child: Scaffold(
        body: ScrollScreen(
          child: Column(
            children: [
              SearchBar(
                label: item.name,
                iconLeft: SearchBarIcon(
                    onTap: () => Navigator.pop(context), src: arrowLeftIcon),
                iconRight: SearchBarIcon(onTap: () {}, src: sortIcon),
              ),
              Builder(
                builder: (productListContext) => FilterSearchList<ProductOption>(
                  items: options,
                  onSelectedChange: (current) {
                    if(current.type == ClothTypes.ALL){
                      productListContext.read<ProductItemListBloc>().add(OnProductItemListChange(itemList: items));
                    }else{
                      final temp = items.where((element) => element.type == current.type).toList();
                      productListContext.read<ProductItemListBloc>().add(OnProductItemListChange(itemList: temp));
                    }
                  },
                )),
              Container(
                padding: EdgeInsets.all(width * 0.05),
                child: BlocBuilder<ProductItemListBloc, ProductItemListState>(
                  builder: (context, state) => ProductList(items: state.itemList),
                ),
              ),
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
      ),
    );
  }
}
