import 'package:efashion/view/screens/home/widgets/components/circle.dart';
import 'package:efashion/view/widgets/components/spacer.dart';
import 'package:flutter/material.dart';

import 'package:efashion/constant.dart';

class AccountPage extends StatelessWidget{
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = windowWidth(context);
    double height = windowHeight(context);
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Account',
            style: TextStyle(fontSize: 40),
          ),
          SpaceVertical(height: height*0.1,),
          Circle(size: width*0.5, color: primaryColor,
            child: Circle(size: width*0.47,
              child: Icon(Icons.person_pin_rounded, size: width*0.30, color: primaryColor,),
            ),
          ),
          const SpaceVertical(),
          const Text('You are guest login.',
            style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: textColor
            ),
          ),
          const SpaceVertical(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('To sigin click ', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: textColor
                ),
              ),
              Text('here',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, decoration: TextDecoration.underline
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
