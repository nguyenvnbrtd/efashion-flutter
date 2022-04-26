import 'package:bloc/bloc.dart';
import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view_model/cubits/indicator_cubit.dart';
import 'package:flutter/material.dart';

import 'package:efashion/model/languages/eng.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import 'package:efashion/view_model/functions/debounce.dart';

import 'components/flash_sale_list_item.dart';
import 'components/indicator_item.dart';

class FlashSale extends StatelessWidget {
  final Debounce _debounce = Debounce(delay: 200);
  final ScrollController _scrollController = ScrollController();

  final List<ProductItem> productItems;

  FlashSale({Key? key, required this.productItems}) : super(key: key);

  int current = 0;
  bool isFirst = true;
  double elementSize = 0;
  double indicatorSize = 0;
  double indicatorPosition = 0;
  Duration duration = const Duration(milliseconds: 200);

  void scrollTo(int index) {
    _scrollController.animateTo(current * elementSize,
        duration: duration, curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;
    elementSize = windowSize.width * 0.9;
    indicatorSize = elementSize*0.9/productItems.length;
    indicatorPosition = (elementSize - indicatorSize*productItems.length) / (productItems.length +1);

    void onScrollLeft() {
      context.read<IndicatorCubit>().scrollToLeft();
      scrollTo(current--);
    }

    void onScrollRight() {
      context.read<IndicatorCubit>().scrollToRight();
      scrollTo(current++);
    }

    void onHorizontalDragUpdate (details){
      _debounce.runBefore(action: () {
        if (!details.primaryDelta!.isNegative) {
          if (current > 0) {
            onScrollLeft();
          }
        } else {
          if (current < productItems.length - 1) {
            onScrollRight();
          } //length -1
        }
      });
    }

    return Container(
      width: elementSize,
      height: 120,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          //all the product in splash sale
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(children: productItems.map((e) => FlashSaleItem(item: e)).toList()),
          ),
          //the thing to cover and control the scroll view above,
          GestureDetector(
            onHorizontalDragUpdate: onHorizontalDragUpdate,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.55),
                  primaryColor.withOpacity(0.55)
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //label and view more
                  GestureDetector(
                    onTap: () {
                      print('tatatatab');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: elementSize * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eng['flash_sale_label']!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            eng['view_more_flash_sale_label']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: primaryLightColor,
                            ),
                          ),
                        ],
                      )),
                  ),
                  //indicator here
                  BlocBuilder<IndicatorCubit, int>(
                    builder: (_, state) => Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: productItems.map((e) => IndicatorItem(width: indicatorSize)).toList()
                        ),
                        AnimatedPositioned(
                          child: IndicatorItem(width: indicatorSize, height: 3),
                          duration: duration,
                          left: (indicatorPosition*(state+1) + indicatorSize*state ).toDouble(),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
