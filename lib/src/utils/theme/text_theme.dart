import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginsys/src/constants/colors.dart';

// Custom Text Theme class

class TText {
  TText._();
  static TextTheme lightTheme = TextTheme(
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.5,
          color: tDarkColor,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          color: tDarkColor,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: tDarkColor,
        ),
        displayLarge: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: tDarkColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: tDarkColor,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: tDarkColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: tDarkColor,
        ),
      );

  static TextTheme darkTheme = TextTheme(
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.5,
          color: tWhiteColor,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          color: tWhiteColor,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: tWhiteColor,
        ),
        displayLarge: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: tWhiteColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: tWhiteColor,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: tWhiteColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: tWhiteColor,
        ),
      );
}
