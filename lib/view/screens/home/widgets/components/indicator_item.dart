import 'package:flutter/material.dart';

class IndicatorItem extends StatelessWidget {
  const IndicatorItem({Key? key, this.width = 50, this.height = 1, this.color = Colors.white}) : super(key: key);

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(height/2)),
    );
  }
}
