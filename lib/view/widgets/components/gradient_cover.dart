import 'package:flutter/material.dart';

class GradientCover extends StatelessWidget{
  const GradientCover({Key? key, required this.colors, this.onTab, this.child, this.opacity = 0.55}) : super(key: key);

  final List<Color> colors;
  final VoidCallback? onTab;
  final Widget? child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Stack(
        children: [
          child ?? Container(),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors.map((e) => e.withOpacity(opacity)).toList())
            ),
          ),
        ],
      ),
    );
  }
}