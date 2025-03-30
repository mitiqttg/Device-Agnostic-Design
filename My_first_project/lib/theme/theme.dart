import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightMode = ThemeData(
  textTheme: GoogleFonts.actorTextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary:  Color.fromARGB(255, 231, 132, 132),
    onPrimary:  Color.fromARGB(255, 141, 157, 221),
    secondary:  Color.fromARGB(255, 0, 0, 0),
    onSecondary:  Color.fromARGB(255, 0, 0, 0),
    surface:  Color.fromARGB(255, 178, 228, 248),
    onSurface:  Color.fromARGB(255, 42, 49, 77),
    onPrimaryContainer:  Color.fromARGB(255, 0, 2, 3),
    secondaryContainer:  Color.fromARGB(255, 144, 222, 214),
    onSecondaryContainer:  Color.fromARGB(255, 2, 2, 2),
    error:  Color(0xffcf6679),
    onError: Colors.black,
  ),
);

final darkMode = ThemeData(
  textTheme: GoogleFonts.actorTextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary:  Color.fromARGB(255, 72, 75, 245),
    onPrimary:  Color.fromARGB(255, 182, 149, 78),
    secondary:  Color.fromARGB(255, 224, 79, 79),
    onSecondary:  Color.fromARGB(255, 24, 150, 81),
    surface:  Color.fromARGB(255, 0, 0, 0),
    onSurface:  Color.fromARGB(255, 77, 69, 42),
    onPrimaryContainer:  Color.fromARGB(255, 112, 37, 90),
    secondaryContainer:  Color.fromARGB(255, 11, 255, 231),
    onSecondaryContainer:  Color.fromARGB(255, 2, 2, 2),
    error:  Color(0xffcf6679),
    onError: Colors.black,
  ),
);