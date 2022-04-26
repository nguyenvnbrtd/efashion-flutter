import 'package:efashion/model/models/product_item.dart';
import 'package:equatable/equatable.dart';

class ProductItemListState extends Equatable{
  final List<ProductItem> itemList;

  const ProductItemListState({required this.itemList});

  factory ProductItemListState.initial(){
    return const ProductItemListState(itemList: []);
  }

  ProductItemListState cloneWith({
    List<ProductItem>? itemList,
  }){
    return ProductItemListState(itemList: itemList ?? this.itemList);
  }

  @override
  List<Object?> get props => [itemList];
}