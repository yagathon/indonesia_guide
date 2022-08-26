import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  static const double h1Tsz = 24;
  static const double bigTsz = 50;
  String indonesiaMap = "assets/indonesian-map.json";

  var szWhite50 = GoogleFonts.sanchez(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.white60,
      letterSpacing: -2,
      fontSize: bigTsz,
    ),
  );

  var szBlack24 = GoogleFonts.sanchez(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.black54,
      letterSpacing: -2,
      fontSize: h1Tsz,
    ),
  );

  var h1BlackBolds = const TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.black,
    letterSpacing: -2,
    fontSize: h1Tsz,
  );
}
