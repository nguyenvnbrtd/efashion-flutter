
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget{
  const Circle({Key? key, this.size = 10, this.color = Colors.white, this.child}) : super(key: key);
  final double size;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size/2),
          color: color
      ),
      child: Center(
        child: child,
      ),
    );
  }
}