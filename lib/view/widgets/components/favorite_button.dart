import 'package:efashion/constant.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget{
  final ValueChanged<bool>? onChange;
  final double size;

  const FavoriteButton({Key? key, this.onChange, this.size = 50}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteButton();
}

class _FavoriteButton extends State<FavoriteButton>{
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    void onTab (){
      setState(() {
        isSelected = !isSelected;
        widget.onChange != null ?  widget.onChange!(isSelected) : (){};
      });
    }

    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: widget.size,
        height: widget.size,
        padding: EdgeInsets.all(widget.size/4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.size/2),
            boxShadow: [
              BoxShadow(
                color: (isSelected ? primaryColor : Colors.grey).withOpacity(0.3),
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 0.50,
                //blurStyle: BlurStyle.outer,//extend the shadow
                offset: const Offset(
                  0.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ]
        ),
        child: Center(
          child: Image.asset(isSelected ? favoriteIcon : notFavoriteIcon),
        ),
      ),
    );
  }

}