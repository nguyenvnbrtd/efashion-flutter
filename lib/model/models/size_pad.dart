import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ClothSize{
  XXS,
  XS,
  S,
  M,
  L,
  XL,
  XXL
}

class SizePad extends Equatable{

  final String name;
  final ClothSize size;

  const SizePad({required this.name, required this.size});

  @override
  List<Object?> get props => [name, size];
}