import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorPad extends Equatable{

  final String name;
  final String color;

  const ColorPad({required this.name, required this.color});

  @override
  List<Object?> get props => [name, color];
}