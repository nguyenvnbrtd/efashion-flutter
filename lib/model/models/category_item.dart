import '../../constant.dart';

class CategoryItem{
  final String categoryId;
  final String name;
  final String image;

  CategoryItem({required this.categoryId, this.name = 'none', this.image = emptyImage});
}