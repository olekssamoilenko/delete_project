import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color redLight = Color(0xFFFF8080);
const Color redLight1 = Color(0xFFFDEFEE);
const Color darkColor1 = Color(0xFF4A4E71);
const Color whiteColor = Color(0xFFffffff);
const Color lightGreyColor1 = Color(0xFF6F91BC);
const Color darkColor2 = Color(0xFF151D51);
const Color greenColor = Color(0xFF27B274);
const Color lightBlueColor1 = Color(0xFF70C3FF);
const Color darkBlueColor1 = Color(0xFF4B65FF);

class ApplicationTheme {
  ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return darkColor2.withOpacity(0.1);
        }
        return whiteColor; // default color when enabled
      }),
      errorStyle: const TextStyle(
        color: redLight,
        fontSize: 13,
      ),
      // Hint text style when field is enabled
      hintStyle: const TextStyle(
        color: darkColor1,
        fontSize: 16,
      ),

      // Hint text style when field is disabled
      floatingLabelStyle: const TextStyle(
        color: lightGreyColor1,
        fontSize: 16,
      ),
      // Hint text style when field is disabled
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: darkColor2.withOpacity(0.2), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: redLight, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: redLight, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: darkColor2, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: darkColor2.withOpacity(0.2), width: 2),
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: darkBlueColor1,
          foregroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 90.5, vertical: 17),
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: GoogleFonts.inter().fontFamily,
          )),
    ),
    // Text theme for input field text
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: darkColor1,
      ),
      bodyLarge: const TextStyle(
        color: darkColor1,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 13,
        color: darkColor1,
      ),
    ),
  );
}
