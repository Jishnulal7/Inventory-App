import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
    primaryColor: const Color.fromRGBO(103, 58, 183, 1),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(103, 58, 183, 1),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(150, 55),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.deepPurple,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
  );
}
