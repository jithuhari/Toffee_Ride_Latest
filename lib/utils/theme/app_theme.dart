import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toffee_ride/utils/theme/theme_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.comicNeue(fontSize: 18, fontWeight: FontWeight.normal),
        labelStyle:
            GoogleFonts.comicNeue(fontSize: 18, fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: primaryTextColor,
            textStyle: GoogleFonts.comicNeue(
                fontSize: 23, 
                fontWeight: FontWeight.w900)),
      ),

      textTheme: TextTheme(
        headline1:
            GoogleFonts.comicNeue(
              fontSize: 23, 
              fontWeight: FontWeight.w900, 
              color: primaryColor),
        headline2:
            GoogleFonts.comicNeue(
              fontSize: 21, 
              fontWeight: FontWeight.bold, 
              color: primaryColor),
        headline3:
            GoogleFonts.comicNeue(
              fontSize: 18, 
              fontWeight: FontWeight.normal, 
              color: primaryTextColor),
        bodyText1:
            GoogleFonts.comicNeue(
              fontSize: 15, 
              fontWeight: FontWeight.normal, 
              color: primaryTextColor),
        bodyText2:
            GoogleFonts.comicNeue(
              fontSize: 13, 
              fontWeight: FontWeight.normal, 
              color: primaryTextColor),
        button:
            GoogleFonts.comicNeue(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: primaryTextColor),
      ));

  static final ThemeData lightThemeTab = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.comicNeue(fontSize: 18, fontWeight: FontWeight.normal),
        labelStyle:
            GoogleFonts.comicNeue(fontSize: 18, fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: primaryTextColor,
            textStyle: GoogleFonts.comicNeue(
                fontSize: 27, 
                fontWeight: FontWeight.w900)),
      ),

      textTheme: TextTheme(
        headline1:
            GoogleFonts.comicNeue(
              fontSize: 27, 
              fontWeight: FontWeight.w900, 
              color: primaryColor),
        headline2:
            GoogleFonts.comicNeue(
              fontSize: 25, 
              fontWeight: FontWeight.bold, 
              color: primaryColor),
        headline3:
            GoogleFonts.comicNeue(
              fontSize: 22, 
              fontWeight: FontWeight.normal, 
              color: primaryTextColor),
        bodyText1:
            GoogleFonts.comicNeue(
              fontSize: 19, 
              fontWeight: FontWeight.normal, 
              color: primaryTextColor),
        bodyText2:
            GoogleFonts.comicNeue(
              fontSize: 17, 
              fontWeight: FontWeight.normal, 
              color: primaryTextColor),
        button:
            GoogleFonts.comicNeue(
              fontSize: 22, 
              fontWeight: FontWeight.bold, 
              color: primaryTextColor),
      ));
}
