import 'package:efashion/constant.dart';
import 'package:equatable/equatable.dart';

class ProductItem extends Equatable {
  final String productId;
  final String categoryId;
  final String image;
  final List<String>? imageDescription;
  final String name;
  final String description;
  final double price;
  final double sale;
  final bool isInStock;
  final List<UserRating> rating = [];

  final ClothTypes type;

  void addRating(UserRating rating) {
    this.rating.add(rating);
  }

  double getRating() {
    try {
      double result = 0;
      for (UserRating u in rating) {
        result = result + u.rate;
      }
      return rating.isNotEmpty ? result / rating.length : 5;
    } catch (e) {
      return 0;
    }
  }

  double getPrice() {
    return price - price * sale / 100;
  }

  ProductItem({
    required this.productId,
    required this.categoryId,
    this.name = 'none',
    this.image = emptyImage,
    this.imageDescription,
    this.description = '',
    this.price = 0,
    this.sale = 0,
    this.isInStock = false,
    required this.type,
  });

  @override
  String toString() {
    return '$name: $productId, $type ';
  }

  @override
  List<Object?> get props => [
    productId,
    categoryId,
    name,
    image,
    imageDescription,
    description,
    price,
    sale,
    isInStock,
    type,
    rating
  ];
}

class UserRating {
  final String userId;
  final double rate;
  final String comment;

  UserRating({required this.userId, required this.rate, this.comment = ''});
}
