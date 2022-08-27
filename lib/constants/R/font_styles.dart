import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indonesia_guide/constants/r.dart';

class FontStyles {
  static const double big = 50;
  static const double h1 = 32;
  static const double h2 = 26;
  static const double h3 = 22;
  static const double h4 = 20;

  String indonesiaMap = "assets/indonesian-map.json";

  var szWhite50 = GoogleFonts.sanchez(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.white60,
      letterSpacing: -2,
      fontSize: big,
    ),
  );

  var szBlack24 = GoogleFonts.sanchez(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.black54,
      letterSpacing: -2,
      fontSize: h1,
    ),
  );

  var h1BlackBold = const TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.black,
    fontSize: h1,
  );

  var h2BlackBold = const TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.black,
    fontSize: h2,
  );

  var normalBlackBold = const TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  var normalWhiteBold = const TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.white60,
  );

  var normalYellowBold14Spacing = TextStyle(
    fontWeight: FontWeight.bold,
    color: R.colors.primary,
    letterSpacing: 1.5,
    fontSize: 14,
  );
}
