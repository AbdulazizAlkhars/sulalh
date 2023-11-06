import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static double _widthFactor = 1.0;

  static void setWidthFactor(BuildContext context) {
    _widthFactor = MediaQuery.of(context).size.width / 375;
  }

  static double widthFactor(double value) {
    return _widthFactor * value;
  }

  // Titles
  static TextStyle title1({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: widthFactor(60),
      fontWeight: FontWeight.bold,
      letterSpacing: widthFactor(0.37),
      color: color,
    );
  }

  static TextStyle title2({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: widthFactor(40),
      fontWeight: FontWeight.w600,
      letterSpacing: widthFactor(-0.6),
      color: color,
    );
  }

  static TextStyle title3({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: widthFactor(34),
      fontWeight: FontWeight.w600,
      letterSpacing: widthFactor(0.24),
      color: color,
    );
  }

  static TextStyle title4({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: widthFactor(24),
      fontWeight: FontWeight.w600,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  static TextStyle title5({required Color color}) {
    return GoogleFonts.sourceSerifPro(
      fontSize: widthFactor(20),
      fontWeight: FontWeight.w600,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  // Headlines
  static TextStyle headline1({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(24),
      fontWeight: FontWeight.normal,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  static TextStyle headline2({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(20),
      fontWeight: FontWeight.w500,
      letterSpacing: widthFactor(0.24),
      color: color,
    );
  }

  static TextStyle headline3({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(18),
      fontWeight: FontWeight.w500,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  static TextStyle headline4({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(16),
      fontWeight: FontWeight.w500,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  // Body
  static TextStyle body1({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(14),
      fontWeight: FontWeight.w500,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  static TextStyle body2({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(14),
      fontWeight: FontWeight.normal,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  // Captions
  static TextStyle caption1({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(12),
      fontWeight: FontWeight.w600,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  static TextStyle caption2({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(12),
      fontWeight: FontWeight.normal,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }

  static TextStyle caption3({required Color color}) {
    return GoogleFonts.ibmPlexSans(
      fontSize: widthFactor(10),
      fontWeight: FontWeight.normal,
      letterSpacing: widthFactor(0),
      color: color,
    );
  }
}
