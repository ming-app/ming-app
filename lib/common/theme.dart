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
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
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
    extensions: const <ThemeExtension<dynamic>>{
      MingCustomTheme(
        orange: Color(0xfff15918),
        inputBlue: Color(0xff96beff),
        inputRed: Color(0xffff334b),
      ),
    });

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

class MingCustomTheme extends ThemeExtension<MingCustomTheme> {
  final Color? orange;
  final Color? inputBlue;
  final Color? inputRed;

  const MingCustomTheme({
    this.orange,
    this.inputBlue,
    this.inputRed,
  });

  @override
  ThemeExtension<MingCustomTheme> copyWith({
    Color? orange,
    Color? inputBlue,
    Color? inputRed,
  }) {
    return MingCustomTheme(
      orange: orange ?? this.orange,
      inputBlue: inputBlue ?? this.inputBlue,
      inputRed: inputRed ?? this.inputRed,
    );
  }

  @override
  ThemeExtension<MingCustomTheme> lerp(
      ThemeExtension<MingCustomTheme>? other, double t) {
    if (other is! MingCustomTheme) {
      return this;
    }

    return MingCustomTheme(
      orange: Color.lerp(orange, other.orange, t),
      inputBlue: Color.lerp(inputBlue, other.inputBlue, t),
      inputRed: Color.lerp(inputRed, other.inputRed, t),
    );
  }
}
