import 'package:bloc/bloc.dart';
import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:efashion/view_model/cubits/indicator_cubit.dart';
import 'package:flutter/material.dart';

import 'package:efashion/model/languages/eng.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import 'package:efashion/view_model/functions/debounce.dart';

import '../../screens/home/widgets/components/indicator_item.dart';

typedef OnItemTap<T> = Function(T item);

abstract class ScrollImageList<T> extends StatelessWidget {
  final Debounce _debounce = Debounce(delay: 200);
  final ScrollController _scrollController = ScrollController();

  final List<T> items;
  final double? width;
  final double? height;
  final Widget? child;
  OnItemTap<T>? _onItemTap;

  ScrollImageList({Key? key, required this.items, this.width, this.child, this.height}) : super(key: key);

  int current = 0;
  bool isFirst = true;
  double elementSize = 0;
  double indicatorSize = 0;
  double indicatorPosition = 0;
  Duration duration = const Duration(milliseconds: 200);

  Widget itemDisplayWidget(BuildContext context, T item){
    return Container();
  }

  Widget body(BuildContext context){
    return Container();
  }

  /// sử lý sự kiện của item (action of item)
  void setOnItemTap(OnItemTap action){
    _onItemTap ??= action;
  }

  void scrollTo(int index) {
    _scrollController.animateTo(current * elementSize,
        duration: duration, curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    elementSize = width ?? MediaQuery.of(context).size.width * 0.9;
    indicatorSize = elementSize*0.9/items.length;
    indicatorPosition = (elementSize - indicatorSize*items.length) / (items.length +1);

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
          if (current < items.length - 1) {
            onScrollRight();
          } //length -1
        }
      });
    }

    return Container(
      width: elementSize,
      height: height ?? 120,
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
            child: Row(children: items.map((e) => _ItemDisplaySized(child: itemDisplayWidget(context, e), width: elementSize)).toList()),
          ),
          //the thing to cover and control the scroll view above,
        BlocBuilder<IndicatorCubit, int>(
          builder: (_, state) => GestureDetector(
            onTap: (){
              try{
                if (_onItemTap != null) _onItemTap!(items[state]);
              }catch(e){
                print(e);
              }
            },
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
                  Expanded(child: body(context)),
                  //indicator here
                  SizedBox(
                    height: 10,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: items.map((e) => IndicatorItem(width: indicatorSize)).toList()
                        ),
                        AnimatedPositioned(
                          child: IndicatorItem(width: indicatorSize, height: 3),
                          duration: duration,
                          left: (indicatorPosition*(state+1) + indicatorSize*state ).toDouble(),
                        ),
                      ],
                    ),
                  ),
                  const SpaceVertical(height: 10)
                ],
              ),
            ),
          )),
        ]
      )
    );
  }
}

class _ItemDisplaySized extends StatelessWidget{
  final Widget? child;
  final double width;

  const _ItemDisplaySized({Key? key, this.child, required this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: double.infinity,
      child: child,
    );
  }
}