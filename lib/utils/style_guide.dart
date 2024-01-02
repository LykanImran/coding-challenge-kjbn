import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color newBlue = Color(0XFF0311EB);
Color primaryColor = newBlue;
//Color primaryColor = bluecool; //deepblue;
const primaryLight = const Color(0xFFFF9F59);
const primaryDark = const Color(0xFFFF9F59);

Color secondaryColor = Colors.green;
const secondaryLight = const Color(0xFFFF9F59);
const secondaryDark = const Color(0xFFFF9F59);

const Color gradientStart = const Color(0xFFfbab66);
const Color gradientEnd = const Color(0xFFf7418c);

const Color primaryBackground = notWhite;

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

///>>>>>>>>>>>>>>>>>>>>>>>>  COLORS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
const Color glowPurple = Color(0xFF882DEB);
const Color notWhite = Color(0xFFEDF0F2);
const Color nearlyWhite = Color(0xFFFEFEFE);
const Color white = Color(0xFFFFFFFF);
const Color nearlyBlack = Color(0xFF213333);
const Color grey = Color(0xFF3A5160);
const Color dark_grey = Color(0xFF313A44);
const Color darkText = Color(0xFF253840);
const Color darkerText = Color(0xFF17262A);
const Color lightText = Color(0xFF4A6572);
const Color deactivatedText = Color(0xFF767676);
const Color dismissibleBackground = Color(0xFF364A54);
const Color chipBackground = Color(0xFFEEF1F3);
const Color spacer = Color(0xFFF2F2F2);
const Color bluecool = const Color(0xFF3e64ff);
const Color deepblue = const Color(0xFF033fff);
const Color lightblue = const Color(0xFF2f4bff);
const Color fbBlue = const Color(0xFF4267B2);

/// >>>>>>>>>>>>>>>>>>>>> TEXTSTYLE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// var primaryFont = "Quicksand";

TextStyle primaryFont = GoogleFonts.lato();

TextStyle display1 = primaryFont.copyWith(
  // h4 -> display1
  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.4,
  height: 0.9,
  color: darkerText,
);

TextStyle display2 = primaryFont.copyWith(
  // h4 -> display1

  fontSize: 20,
  letterSpacing: 0.4,
  height: 0.9,
  color: Colors.black,
);

TextStyle display3 = primaryFont.copyWith(
  // h4 -> display1

  fontSize: 18,
  letterSpacing: 0.4,
  height: 0.9,
  color: Colors.black,
);

TextStyle btnTextBlack = primaryFont.copyWith(
  // subtitle2 -> subtitle

  fontWeight: FontWeight.w400,
  fontSize: 18,
  letterSpacing: -0.04,
  color: Colors.black,
);

TextStyle btnTextWhite = primaryFont.copyWith(
  // subtitle2 -> subtitle
  fontWeight: FontWeight.w400,

  fontSize: 18,
  letterSpacing: -0.04,
  color: Colors.white,
);

TextStyle title = primaryFont.copyWith(
    color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);

TextStyle headline = primaryFont.copyWith(
  // h5 -> headline

  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.27,
  color: darkerText,
);

TextStyle subtitle = primaryFont.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: 18,
  letterSpacing: -0.04,
  color: darkText,
);

TextStyle body1 = primaryFont.copyWith(
  // body2 -> body1

  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: -0.05,
  color: darkText,
);

TextStyle body2 = primaryFont.copyWith(
  // body1 -> body2

  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.2,
  color: darkText,
);

TextStyle descriptionWhite = primaryFont.copyWith(
    fontSize: 16, color: Colors.white, fontFamily: 'Quicksand');

TextStyle description = primaryFont.copyWith(
    fontSize: 16, color: Colors.black, fontFamily: 'Quicksand');
