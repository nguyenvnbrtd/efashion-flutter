import 'package:flutter/material.dart';

class ButtonImageIcon extends StatelessWidget{
  const ButtonImageIcon({
    Key? key,
    required this.onTab,
    this.backGroundColor = Colors.transparent,
    this.iconColor = Colors.white,
    this.src = '',
  }) : super(key: key);

  final VoidCallback onTab;
  final Color backGroundColor;
  final Color iconColor;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backGroundColor,
      child: InkWell(
        onTap: onTab,
        child: Image.asset(src, color: iconColor,),
      ),
    );
  }

}