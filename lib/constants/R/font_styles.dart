import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  String indonesiaMap = "assets/indonesian-map.json";

  var szWhite50 = GoogleFonts.sanchez(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.white60,
      letterSpacing: -2,
      fontSize: 50,
    ),
  );
  var szBlack24 = GoogleFonts.sanchez(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.black54,
      letterSpacing: -2,
      fontSize: 24,
    ),
  );
}
