import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../model/models/product_item.dart';
import '../../../widgets/components/scroll_image_list.dart';
import 'components/flash_sale_list_item.dart';

class FlashSaleTmpl extends ScrollImageList<ProductItem>{
  FlashSaleTmpl({Key? key, required List<ProductItem> items}) : super(key: key, items: items);

  @override
  Widget body(BuildContext context) {
    setOnItemTap((item) => Navigator.pushNamed(context, itemDescriptionScreen));
    return super.body(context);
  }

  @override
  Widget itemDisplayWidget(BuildContext context, ProductItem item){
    return FlashSaleItem(item: item);
  }
}