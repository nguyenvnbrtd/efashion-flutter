import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/screens/item_description/widgets/item_description_image_list.dart';
import 'package:efashion/view/widgets/components/scroll_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../view_model/cubits/indicator_cubit.dart';

class ItemDescriptionScreen extends StatelessWidget{
  const ItemDescriptionScreen({Key? key, this.item}) : super(key: key);

  final ProductItem? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: item != null ? ScrollScreen(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              BlocProvider<IndicatorCubit>(
                  create: (_) => IndicatorCubit(),
                  child: ItemDescriptionImageList(items: item?.imageDescription ?? [])
              )
            ],
          ),
        ),
      ) : Center(
        child: Image.asset(emptyImage, color: Colors.grey),
      ),
    );
  }
}