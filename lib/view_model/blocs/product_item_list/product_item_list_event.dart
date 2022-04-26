import 'package:efashion/model/models/product_item.dart';
import 'package:equatable/equatable.dart';

abstract class ProductItemListEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class OnProductItemListChange extends ProductItemListEvent{
  final List<ProductItem> itemList;

  OnProductItemListChange({required this.itemList});

  @override
  List<Object?> get props => [itemList];
}