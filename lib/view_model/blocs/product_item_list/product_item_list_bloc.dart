import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view_model/blocs/product_item_list/product_item_list_event.dart';
import 'package:efashion/view_model/blocs/product_item_list/product_item_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemListBloc extends Bloc<ProductItemListEvent, ProductItemListState> {
  ProductItemListBloc(List<ProductItem> items) : super(ProductItemListState(itemList: items)){
    on<OnProductItemListChange> ((event, emit) => emit(state.cloneWith(itemList: event.itemList)));
  }
}
