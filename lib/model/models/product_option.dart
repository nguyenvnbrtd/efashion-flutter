import 'package:equatable/equatable.dart';

import '../../constant.dart';

class ProductOption extends Equatable{

  final int id;
  final String name;
  final ClothTypes type;

  const ProductOption({required this.id, required this.type, required this.name});

  @override
  List<Object?> get props => [id, name, type];

}
