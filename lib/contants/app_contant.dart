import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final iconBool = StateProvider<bool>((ref) => false);

class AppConstants {
  static IconData iconLight = Icons.wb_sunny;
  static IconData iconDark = Icons.nights_stay;

  static ThemeData lightTheme = ThemeData(
    appBarTheme:
        AppBarTheme(backgroundColor: Color.fromARGB(255, 221, 163, 159)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 220, 174, 170))),
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
          fontSize: 12, color: Color.fromARGB(255, 86, 76, 175)),
      bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color.fromARGB(255, 0, 0, 0)),
      bodyLarge: TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w700),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey)),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodySmall:
          TextStyle(fontSize: 16, color: Color.fromARGB(255, 86, 76, 175)),
      bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Color.fromARGB(255, 255, 255, 255)),
      bodyLarge: TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w700),
    ),
  );
}
