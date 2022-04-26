import 'package:efashion/model/models/product_item.dart';
import 'package:efashion/view/widgets/components/sale_label.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant.dart';
import 'favorite_button.dart';

class ProductItemCard extends StatelessWidget{
  const ProductItemCard({Key? key, required this.item}) : super(key: key);
  final ProductItem item;

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    double imageSize = width *0.425;
    double favoriteButtonSize = imageSize*0.2;

    double rating = item.getRating();

    return SizedBox(
        width: imageSize,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Image.asset(item.image),
                    ),
                    item.sale != 0 ? Positioned(
                      top: 10,
                      left: 0,
                      child: SaleLabel(
                        label: '- ${item.sale} %',
                        width: imageSize*0.3,
                        height: imageSize*0.15,
                      ),

                    ) : Container(),
                  ],
                ),
                const SpaceVertical(height: 5,),
                Container(
                  height: imageSize*0.09,
                  alignment: Alignment.centerLeft,
                  color: Colors.transparent,
                  child: RatingBar.builder(
                    initialRating: rating,
                    minRating: 0,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: imageSize*0.1,
                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),

                    onRatingUpdate: (rating) {

                      print(rating);

                    },

                  ),
                  // child: ShaderMask(
                  //   child: Image.asset(ratingIcon, color: Colors.red),
                  //   shaderCallback: (Rect bounds){
                  //     return LinearGradient(
                  //         colors: [primaryColor, Colors.grey],
                  //         begin: Alignment(0.9, 0),
                  //         stops: [1, 0.3],
                  //         // end: Alignment(1, 1),
                  //     ).createShader(bounds);
                  //   },
                  //   blendMode: BlendMode.srcATop,
                  // ),
                ),
                const SpaceVertical(height: 5,),
                Text(
                  item.name,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14, color: textColor),
                ),
                const SpaceVertical(height: 5,),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(children: [
                        TextSpan(
                          text: '\$' + item.getPrice().toString() + ' ',
                          style: const TextStyle(
                              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        item.sale != 0
                            ? TextSpan(
                          text: '\$' + item.price.toString(),
                          style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        )
                            : const TextSpan()
                      ])),
                )
              ],
            ),
            Positioned(child: FavoriteButton(size: favoriteButtonSize), top: imageSize-favoriteButtonSize/2, right: 10),
          ],
        )
    );
  }

}