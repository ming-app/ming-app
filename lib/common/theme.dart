import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
  ),
  cardTheme: CardTheme(
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      color: Color(0xff7a7a7a),
      fontSize: 14,
    ),
  ),
);

final lightTheme = _theme.copyWith(
  textTheme: GoogleFonts.notoSansNKoTextTheme(_theme.textTheme),
);

final _darkTheme = _theme.copyWith(
  colorScheme: _theme.colorScheme.copyWith(
    brightness: Brightness.dark,
  ),
);

final darkTheme = _darkTheme.copyWith(
  textTheme: GoogleFonts.notoSansNKoTextTheme(_theme.textTheme),
);
