import 'package:flutter/material.dart';

Color secondaryColor = const Color.fromRGBO(255, 255, 255, 1);
Color gradientColor = const Color.fromRGBO(255, 255, 255, 0);
Color primaryColorBlue = const Color.fromRGBO(31, 108, 255, 1);
Color primaryColorOrange = const Color.fromRGBO(255, 153, 0, 1);
Color secondaryColorGrey = const Color.fromRGBO(242, 242, 242, 1);
Color secondarColorBlack = const Color.fromRGBO(0, 0, 0, 1);
Color secondaryColorRed = const Color.fromRGBO(255, 68, 68, 1);
Color secondaryColorDarkGrey = const Color.fromRGBO(249, 249, 249, 1);
Color greyColorText = const Color.fromRGBO(148, 148, 148, 1);
Color greycolor = const Color.fromRGBO(181, 181, 181, 1);
Color greyColor2 = const Color.fromRGBO(148, 148, 148, 1);

class MyTextStyles {
  static TextStyle regular14Grey = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: greyColorText,
  );

  static TextStyle bold18Black = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: secondarColorBlack,
  );

  static TextStyle parentTextColor = TextStyle(
    fontWeight: FontWeight.w500,
    color: secondaryColor,
    fontSize: 16,
  );
  static TextStyle paragraphTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: secondarColorBlack,
    fontSize: 14,
  );

  // Add more styles as needed
}
