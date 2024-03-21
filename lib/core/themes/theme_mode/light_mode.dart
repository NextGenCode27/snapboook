import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade300),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey.shade300,
    elevation: 0,
    selectedItemColor: Colors.grey.shade700,
    unselectedItemColor: Colors.grey.shade500,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
    error: const Color.fromARGB(214, 219, 96, 88),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  scaffoldBackgroundColor: Colors.grey.shade300,
);
