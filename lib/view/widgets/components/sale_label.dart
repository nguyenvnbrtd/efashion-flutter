import 'package:efashion/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SaleLabel extends StatelessWidget {
  String label;
  Color color1;
  Color color2;
  double width;
  double height;
  double? radius;

  SaleLabel({
    Key? key,
    this.label = 'none',
    this.color1 = primaryLightColor,
    this.color2 = primaryColor,
    this.width = 100,
    this.height = 50,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius ?? height / 2),
          bottomRight: Radius.circular(radius ?? height / 2),
        ),
        gradient: LinearGradient(
          begin: const Alignment(1, 0.8),
          end: const Alignment(-0.8, -1),
          colors: [
            color2,
            color1,
          ],
        ),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
