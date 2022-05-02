import 'package:efashion/constant.dart';
import 'package:flutter/material.dart';
import '../../../model/languages/eng.dart';
import '../../screens/search/search_page.dart';
import 'icon_buton.dart';

class SearchBar extends StatelessWidget {
  final Widget? iconLeft;
  final Widget? iconRight;
  final String? label;

  const SearchBar({Key? key, this.iconLeft, this.iconRight, this.label})
      : super(key: key);

  TextStyle titleStyle(Color color) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: label == null ? 24 : 16,
        fontFamily: 'Montserrat');
  }

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: windowSize.height * 0.25,
      child: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: windowSize.width * 0.05),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [primaryLightColor, primaryColor],
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconLeft ??
                        const SizedBox(
                          width: 22,
                          height: 22,
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(eng['appTitle1']!,
                                style: titleStyle(primaryColor)),
                            Text(eng['appTitle2']!,
                                style: titleStyle(Colors.white))
                          ],
                        ),
                        label != null
                            ? Text(label!,
                                style: titleStyle(Colors.white)
                                    .copyWith(fontSize: 22))
                            : Container()
                      ],
                    ),
                    iconRight ??
                        const SizedBox(
                          width: 22,
                          height: 22,
                        ),
                  ],
                ),
              )),
              Container(
                height: windowSize.height * 0.05,
                width: double.infinity,
                color: Colors.white,
              ),
            ],
          ),
          Positioned(
            bottom: windowSize.height * 0.025,
            left: windowSize.width * 0.05,
            right: windowSize.width * 0.05,
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      height: windowSize.height * 0.85,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: SearchPage(),
                    )
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 2.0, // soften the shadow
                          spreadRadius: 1.0,
                          //blurStyle: BlurStyle.outer,//extend the shadow
                          offset: const Offset(
                            1.0, // Move to right 10  horizontally
                            1.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ]),
                  clipBehavior: Clip.hardEdge,
                  // height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: windowSize.height * 0.05,
                        child: ButtonImageIcon(
                          onTab: () {},
                          src: searchIcon,
                          iconColor: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            eng['search_hint']!,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

class SearchBarIcon extends StatelessWidget {
  const SearchBarIcon({Key? key, required this.onTap, required this.src})
      : super(key: key);

  final VoidCallback onTap;
  final String src;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 22,
        height: 22,
        child: ButtonImageIcon(
          onTab: onTap,
          src: src,
        ));
  }
}
