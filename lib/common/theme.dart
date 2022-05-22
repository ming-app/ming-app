import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
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
