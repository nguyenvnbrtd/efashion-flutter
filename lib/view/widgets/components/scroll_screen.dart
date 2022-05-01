import 'package:flutter/material.dart';

import '../../../constant.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double height = windowHeight(context);
    double width = windowWidth(context);

    return Container(
        color: Colors.white,
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: child
        )
    );
  }
}
