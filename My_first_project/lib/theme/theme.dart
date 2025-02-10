import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightMode = ThemeData(
  textTheme: GoogleFonts.actorTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 255, 255, 255),
    brightness: Brightness.light,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ).copyWith(
    primaryContainer: const Color.fromARGB(255, 42, 49, 77),
    onPrimaryContainer: const Color.fromARGB(255, 0, 2, 3),
    secondaryContainer: const Color.fromARGB(255, 144, 222, 214),
    onSecondaryContainer: const Color.fromARGB(255, 2, 2, 2),
    error: const Color(0xffcf6679),
    onError: Colors.black,
  ),
);

final darkMode = ThemeData(
  textTheme: GoogleFonts.actorTextTheme(),
  // scaffoldBackgroundColor:const Color.fromARGB(255, 161, 161, 175),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 0, 0),
    brightness: Brightness.dark,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ).copyWith(
    primaryContainer: const Color.fromARGB(255, 70, 88, 161),
    onPrimaryContainer: const Color.fromARGB(255, 9, 124, 219),
    secondaryContainer: const Color.fromARGB(255, 2, 53, 48),
    onSecondaryContainer: const Color.fromARGB(255, 44, 10, 117),
    error: const Color(0xffcf6679),
    onError: Colors.black,
  ),
);