import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/screens/item_description/widgets/item_description_image_list.dart';
import 'package:efashion/view/widgets/components/product_item_card.dart';
import 'package:efashion/view/widgets/components/scroll_screen.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant.dart';
import '../../../model/models/color_pad.dart';
import '../../../model/models/size_pad.dart';
import '../../../view_model/cubits/indicator_cubit.dart';
import '../../widgets/components/favorite_button.dart';
import '../../widgets/components/filter_item_list.dart';
import '../../widgets/components/icon_buton.dart';
import '../home/widgets/components/section_label.dart';

class ItemDescriptionScreen extends StatelessWidget{
  const ItemDescriptionScreen({Key? key, this.item}) : super(key: key);

  final ProductItem? item;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);

    final relatedItems = <ProductItem>[
      productItems[0],
      productItems[1],
      productItems[2],
      productItems[3],
    ];
    return Scaffold(
      body: item != null ? Stack(
        children: [
        ScrollScreen(
        child: Container(
            width: width,
            color: Colors.white,
            child: Column(
              children: [
                BlocProvider<IndicatorCubit>(
                    create: (_) => IndicatorCubit(),
                    child: ItemDescriptionImageList(items: item?.imageDescription ?? [], width: width, height:  width)
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceVertical(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RatingBar.builder(
                                initialRating: item!.getRating(),
                                minRating: 0,
                                maxRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: width*0.06,
                                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),

                                onRatingUpdate: (rating) {


                                },

                              ),
                              const SpaceHorizontal(),
                              Text(
                                '${item!.rating.length} Reviews',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          Text(
                            item!.isInStock ? 'In Stock' : 'Out Stock',
                            style: TextStyle(
                                color: item!.isInStock ? greenColor : Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],

                      ),
                      const SpaceVertical(height: 5),
                      Text(
                        item!.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18, color: textColor),
                      ),
                      const SpaceVertical(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              TextSpan(
                                text: '\$' + item!.getPrice().toString() + ' ',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              item!.sale != 0
                                  ? TextSpan(
                                text: '\$' + item!.price.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              )
                                  : const TextSpan()
                            ])),
                      ),
                    ],
                  ),
                ),
                const SpaceVertical(),
                FilterSearchList<SizePad>(
                  label: 'Size',
                  items: const [
                    SizePad(name: 'XXS', size: ClothSize.XXS),
                    SizePad(name: 'XS', size: ClothSize.XS),
                    SizePad(name: 'S', size: ClothSize.S),
                    SizePad(name: 'M', size: ClothSize.M),
                    SizePad(name: 'L', size: ClothSize.L),
                    SizePad(name: 'XL', size: ClothSize.XL),
                    SizePad(name: 'XXL', size: ClothSize.XXL),
                    SizePad(name: 'L', size: ClothSize.L),
                    SizePad(name: 'XL', size: ClothSize.XL),
                    SizePad(name: 'XXL', size: ClothSize.XXL),
                  ],
                  onSelectedChange: (item){},),
                const SpaceVertical(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.05),
                  child: Column(
                    children: [
                      const SectionLabel(label: 'Categories'),
                      const SpaceVertical(height: 10),
                      Text(
                        item!.description,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey
                        ),
                      ),
                      const SpaceVertical(),
                      const SectionLabel(label: 'Related Products'),
                      const SpaceVertical(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: relatedItems.map((e) => ProductItemCard(item: e, marginRight: width * 0.05,)).toList(),
                        ),
                      ),
                      const SpaceVertical(height: 5),
                    ],
                  ),
                ),
                const SpaceVertical(height: 70,),
              ],
            ),
          )),
          Positioned(
            child: Container(
              // color: Colors.white,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 2.0, // soften the shadow
                          spreadRadius: 0.50,
                          //blurStyle: BlurStyle.outer,//extend the shadow
                          offset: const Offset(
                            0.0, // Move to right 10  horizontally
                            1.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ]
                    ),
                    child: ButtonImageIcon(onTab: () => Navigator.pop(context), iconColor: Colors.grey, src: arrowLeftIcon),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: width*0.5,
                      height: 40,
                      decoration: BoxDecoration(
                          color: primaryMedColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  FavoriteButton(size: 45, onChange: (status){}, ),
                ],
              ),
            ),
            bottom: 0,
          )
        ],
      ) : Center(
        child: Image.asset(emptyImage, color: Colors.grey),
      )
    );
  }
}
