import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class PromoColors {
  static const bgDeep = Color(0xFF06080D);
  static const bgMid = Color(0xFF0E1219);
  static const bgCard = Color(0xFF151B26);
  static const bgElevated = Color(0xFF1C2433);

  static const purple = Color(0xFF5B4B8A);
  static const purpleLight = Color(0xFF7A6BA8);
  static const navy = Color(0xFF1A2744);

  static const gold = Color(0xFFD4AF6A);
  static const goldLight = Color(0xFFF0E2B8);
  static const ivory = Color(0xFFF5F0E6);

  static const textPrimary = Color(0xFFF5F0E6);
  static const textSecondary = Color(0xFFB8B0A0);
  static const textMuted = Color(0xFF8A8278);
  static const border = Color(0xFF2A3344);
  static const borderGold = Color(0x55D4AF6A);
  static const jadeTint = Color(0xFF6BA88A);
}

class PromoTheme {
  static ThemeData build() {
    final base = ThemeData.dark(useMaterial3: true);
    final textTheme = GoogleFonts.notoSansKrTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: PromoColors.bgDeep,
      colorScheme: const ColorScheme.dark(
        primary: PromoColors.gold,
        secondary: PromoColors.purple,
        surface: PromoColors.bgCard,
        onPrimary: PromoColors.bgDeep,
        onSurface: PromoColors.textPrimary,
      ),
      textTheme: textTheme.apply(
        bodyColor: PromoColors.textPrimary,
        displayColor: PromoColors.textPrimary,
      ),
    );
  }

  static TextStyle heroTitle(BuildContext context) => GoogleFonts.notoSerifKr(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: PromoColors.ivory,
        height: 1.35,
        letterSpacing: -0.5,
      );

  static TextStyle sectionTitle(BuildContext context) => GoogleFonts.notoSerifKr(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: PromoColors.goldLight,
        height: 1.3,
      );

  static TextStyle body(BuildContext context) => GoogleFonts.notoSansKr(
        fontSize: 16,
        color: PromoColors.textSecondary,
        height: 1.7,
      );

  static TextStyle caption(BuildContext context) => GoogleFonts.notoSansKr(
        fontSize: 13,
        color: PromoColors.textMuted,
        height: 1.5,
      );
}
