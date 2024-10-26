import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

bool isDarkMode = false;
bool isLangCheck = false;
bool isSplashAdCheck= false;


TextStyle secondaryTextStyle(double size, Color color, FontWeight fontWeight) =>
    GoogleFonts.inter(color: color, fontSize: size, fontWeight: fontWeight);

TextStyle primaryTextStyle(double size, Color color, FontWeight fontWeight) =>
    GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: fontWeight);
