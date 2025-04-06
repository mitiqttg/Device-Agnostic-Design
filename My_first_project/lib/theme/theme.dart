import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightMode = ThemeData(
  textTheme: GoogleFonts.actorTextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary:  Color.fromARGB(255, 252, 174, 232),
    onPrimary:  Color.fromARGB(255, 0, 0, 0),
    secondary:  Color.fromARGB(255, 123, 165, 228),
    onSecondary:  Color.fromARGB(255, 0, 0, 0),
    surface:  Color.fromARGB(255, 238, 202, 236),
    onSurface:  Color.fromARGB(255, 42, 49, 77),
    onPrimaryContainer:  Color.fromARGB(255, 0, 2, 3),
    secondaryContainer:  Color.fromARGB(255, 144, 222, 214),
    onSecondaryContainer:  Color.fromARGB(255, 2, 2, 2),
    error:  Color.fromARGB(255, 243, 130, 111),
    onError: Colors.black,
  ),
);

final darkMode = ThemeData(
  textTheme: GoogleFonts.actorTextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary:  Color.fromARGB(255, 72, 75, 245),
    onPrimary:  Color.fromARGB(255, 123, 248, 242),
    secondary:  Color.fromARGB(255, 224, 79, 79),
    onSecondary:  Color.fromARGB(255, 24, 150, 81),
    surface:  Color.fromARGB(255, 0, 0, 0),
    onSurface:  Color.fromARGB(255, 77, 69, 42),
    onPrimaryContainer:  Color.fromARGB(255, 112, 37, 90),
    secondaryContainer:  Color.fromARGB(255, 11, 255, 231),
    onSecondaryContainer:  Color.fromARGB(255, 2, 2, 2),
    error:  Color.fromARGB(255, 243, 130, 111),
    onError: Colors.black,
  ),
);