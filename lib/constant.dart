import 'package:efashion/model/models/category_item.dart';
import 'package:efashion/model/models/product_item.dart';
import 'package:flutter/material.dart';

import 'model/models/product_option.dart';

// color

const primaryColor = Color(0xffff6f01);
const primaryMedColor = Color(0xffff9a4c);
const primaryLightColor = Color(0xffffc44c);
const bgColor = Color(0xffdfebfb);
const textColor = Color(0xff464646);
const greenColor = Color(0xff03A600);

//image
// const String loginTheme = 'assets/images/loginTheme.png';
// const String homeTheme = 'assets/images/homeTheme.png';
// const String addGymImage = 'assets/images/addGym.png';
// const String walletImage = 'assets/images/wallet.png';
// const String classesImage = 'assets/images/classes.png';
const String emptyImage = 'assets/images/empty.png';
const String category1 = 'assets/images/category1.png';
const String category2 = 'assets/images/category2.png';
const String category3 = 'assets/images/category3.png';
const String category4 = 'assets/images/category4.png';
const String category5 = 'assets/images/category5.png';
const String category6 = 'assets/images/category6.png';
const String category7 = 'assets/images/category7.png';
const String category8 = 'assets/images/category8.png';
const String category9 = 'assets/images/category9.png';

const String product1 = 'assets/images/pd1.png';
const String product2 = 'assets/images/pd2.png';
const String product3 = 'assets/images/pd3.png';
const String product4 = 'assets/images/pd4.png';
const String product5 = 'assets/images/pd5.png';
const String product6 = 'assets/images/pd6.png';
const String product7 = 'assets/images/pd7.png';
const String product8 = 'assets/images/pd8.png';

const String menuIcon = 'assets/images/menu.png';
const String notifyIcon = 'assets/images/notify.png';
const String searchIcon = 'assets/images/search.png';
const String favoriteIcon = 'assets/images/favorite.png';
const String notFavoriteIcon = 'assets/images/notFavorite.png';
const String ratingIcon = 'assets/images/rating.png';
const String iconStart = 'assets/images/start.png';
const String iconHome = 'assets/images/home.png';
const String iconCategory = 'assets/images/category.png';
const String iconLike = 'assets/images/like.png';
const String iconUser = 'assets/images/user.png';
const String arrowLeftIcon = 'assets/images/arrowLeft.png';
const String sortIcon = 'assets/images/sort.png';

//screen
const String homeScreen = '/';
const String cartScreen = '/cartScreen';
const String itemScreen = '/itemScreen';
const String categoryItemsScreen = '/categoryItemsScreen';
const String itemDescriptionScreen = '/itemDescriptionScreen';

//screen index
const int homePageIndex = 0;
const int categoryPageIndex = 1;
const int favoritePageIndex = 2;
const int userPageIndex = 3;

//width, height
double windowWidth (context) => MediaQuery.of(context).size.width;
double windowHeight (context) => MediaQuery.of(context).size.height;

//Cloth type
enum ClothTypes {
  ALL,
  DRESS,
  TOP,
  SWEATER,
  JEAN,
  COATS
}

//data
List<CategoryItem> categoriesItems = [
  CategoryItem(categoryId: '1', name:  'All Womens', image: category1),
  CategoryItem(categoryId: '2', name:  'New Collection', image: category2),
  CategoryItem(categoryId: '3', name:  'Active / Sports', image: category3),
  CategoryItem(categoryId: '4', name:  'Luxury', image: category4),
  CategoryItem(categoryId: '5', name:  'Swimwear', image: category5),
  CategoryItem(categoryId: '6', name:  'Casual', image: category6),
  CategoryItem(categoryId: '7', name:  'Party', image: category7),
  CategoryItem(categoryId: '8', name:  'Home', image: category8),
  CategoryItem(categoryId: '9', name:  'Baby', image: category9),
];

List<ProductItem> productItems = [
  ProductItem(productId: '1', categoryId: '1', isInStock: true,type: ClothTypes.SWEATER, price: 69, sale: 20, name: 'DKNY t-shirt - colour block front logo', image: product1, imageDescription: [product1, product1, product1], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '2', categoryId: '4', type: ClothTypes.TOP, price: 200, sale: 15, name: 'Polo Ralph Lauren jacket - light blue', image: product2, imageDescription: [product2, product2, product2, product2], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '3', categoryId: '2', isInStock: true, type: ClothTypes.JEAN, price: 35, sale: 0, name: 'Midi dress with buttons short sleeve - pink', image: product3, imageDescription: [product3, product3, product3, product3, product3], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '4', categoryId: '5', type: ClothTypes.TOP, price: 59, sale: 10, name: 'Blazer dress with buttons long sleeve...', image: product4, imageDescription: [product4, product4, product4], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '5', categoryId: '7', isInStock: true, type: ClothTypes.JEAN, price: 199, sale: 50, name: 'Moschnio checkerboard heart dress - blue', image: product5, imageDescription: [product5, product5, product5], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '6', categoryId: '8', isInStock: true, type: ClothTypes.SWEATER, price: 110, sale: 10, name: 'Tommy Hilfiger padded jackets - black with...', image: product6, imageDescription: [product6, product6, product6], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '7', categoryId: '1', type: ClothTypes.COATS, price: 39, sale: 30, name: 'Calvin Klein - lounge hoody with drawstring..', image: product7, imageDescription: [product7, product7, product7], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '8', categoryId: '4', isInStock: true, type: ClothTypes.JEAN, price: 69, sale: 10, name: 'YSL cotton jumper - kashmir - beige ', image: product8, imageDescription: [product8, product8, product8], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '9', categoryId: '3', type: ClothTypes.SWEATER, price: 69, sale: 20, name: 'DKNY t-shirt - colour block front logo', image: product1, imageDescription: [product1, product1, product1], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '10', categoryId: '2', isInStock: true, type: ClothTypes.TOP, price: 200, sale: 15, name: 'Polo Ralph Lauren jacket - light blue', image: product2, imageDescription: [product2, product2, product2, product2], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '11', categoryId: '6', type: ClothTypes.SWEATER, price: 35, sale: 0, name: 'Midi dress with buttons short sleeve - pink', image: product3, imageDescription: [product3, product3, product3, product3, product3], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '12', categoryId: '7', isInStock: true, type: ClothTypes.SWEATER, price: 59, sale: 10, name: 'Blazer dress with buttons long sleeve...', image: product4, imageDescription: [product4, product4, product4], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '13', categoryId: '5', isInStock: true, type: ClothTypes.DRESS, price: 199, sale: 50, name: 'Moschnio checkerboard heart dress - blue', image: product5, imageDescription: [product5, product5, product5], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '14', categoryId: '8', isInStock: true, type: ClothTypes.TOP, price: 110, sale: 10, name: 'Tommy Hilfiger padded jackets - black with...', image: product6, imageDescription: [product6, product6, product6], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '15', categoryId: '4', type: ClothTypes.COATS, price: 39, sale: 30, name: 'Calvin Klein - lounge hoody with drawstring..', image: product7, imageDescription: [product7, product7, product7], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '16', categoryId: '2', isInStock: true, type: ClothTypes.JEAN, price: 69, sale: 10, name: 'YSL cotton jumper - kashmir - beige ', image: product8, imageDescription: [product8, product8, product8], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '17', categoryId: '1', type: ClothTypes.DRESS, price: 69, sale: 20, name: 'DKNY t-shirt - colour block front logo', image: product1, imageDescription: [product1, product1, product1], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '18', categoryId: '4', isInStock: true, type: ClothTypes.SWEATER, price: 200, sale: 15, name: 'Polo Ralph Lauren jacket - light blue', image: product2, imageDescription: [product2, product2, product2, product2], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '19', categoryId: '2', type: ClothTypes.TOP, price: 35, sale: 0, name: 'Midi dress with buttons short sleeve - pink', image: product3, imageDescription: [product3, product3, product3, product3, product3], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '20', categoryId: '3', type: ClothTypes.DRESS, price: 59, sale: 10, name: 'Blazer dress with buttons long sleeve...', image: product4, imageDescription: [product4, product4, product4], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '21', categoryId: '6', isInStock: true, type: ClothTypes.JEAN, price: 199, sale: 50, name: 'Moschnio checkerboard heart dress - blue', image: product5, imageDescription: [product5, product5, product5], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '22', categoryId: '8', type: ClothTypes.DRESS, price: 110, sale: 10, name: 'Tommy Hilfiger padded jackets - black with...', image: product6, imageDescription: [product6, product6, product6], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '23', categoryId: '7', isInStock: true, type: ClothTypes.SWEATER, price: 39, sale: 30, name: 'Calvin Klein - lounge hoody with drawstring..', image: product7, imageDescription: [product7, product7, product7], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
  ProductItem(productId: '24', categoryId: '1', isInStock: true, type: ClothTypes.JEAN, price: 69, sale: 10, name: 'YSL cotton jumper - kashmir - beige ', image: product8, imageDescription: [product8, product8, product8], description: 'Light blue jacket by Polo Ralph Lauren. Button neck with spread collar. Zip placket. Embroidered logo to chest and cuff Side pockets/ Elasticated hem. Regular fit. True to size. Model wears: UK S/ EU S/ US'),
];

final options = <ProductOption>[
  const ProductOption(type: ClothTypes.ALL, name: 'All', id: 0),
  const ProductOption(type: ClothTypes.DRESS, name: 'Dresses', id: 1),
  const ProductOption(type: ClothTypes.TOP, name: 'Tops', id: 2),
  const ProductOption(type: ClothTypes.SWEATER, name: 'Sweaters', id: 3),
  const ProductOption(type: ClothTypes.JEAN, name: 'Jeans', id: 4),
  const ProductOption(type: ClothTypes.COATS, name: 'Coats', id: 5),
];