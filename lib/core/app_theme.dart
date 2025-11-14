import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        colorScheme: ColorScheme.dark(),
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme()));
  }

  static ThemeData get lightTheme {
    return ThemeData(textTheme: GoogleFonts.poppinsTextTheme(TextTheme()));
  }
}
