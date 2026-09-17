import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primary = Color(0xFF97755B); // Brand primary brown
  static const Color secondary = Color(0xFF5F4A34); // Secondary dark brown
  static const Color blackBrown = Color(0xFF1B1611); // Black-brown
  static const Color textCharcoal = Color(0xFF252525); // Main text
  static const Color textGrey = Color(0xFF454545); // Subtitle/label text
  static const Color borderGrey = Color(0xFFD1D1D1); // Divider/border
  static const Color dividerGrey = Color(0xFFD9D9D9); // Divider
  static const Color crimsonRed = Color(0xFFC60F16); // Accent red
  static const Color lightPink = Color(0xFFFFF1F2); // Pink badge back
  static const Color successGreen = Color(0xFF157819); // Badges/Green
  static const Color bgSurface = Color(0xFFF8FBFF); // Background tint
  static const Color whiteOverlay=Color(0xFFF6F6F6);

  // Linear Gradients
  static const LinearGradient promoGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [ blackBrown,secondary,],
    stops: [0.0869576, 0.901303],
  );

  static const LinearGradient packageGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, blackBrown],
    stops: [0.0, 0.79159],
  );

  static const LinearGradient circleBadgeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFC5959), Color(0xFF884747)],
    stops: [0.961538, 1.0],
  );

  // Text Styles (using Outfit font)
  static TextStyle get outfitFont => GoogleFonts.outfit();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: Colors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: outfitFont.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textCharcoal,
        ),
        headlineMedium: outfitFont.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textCharcoal,
        ),
        titleLarge: outfitFont.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textCharcoal,
        ),
        titleMedium: outfitFont.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textCharcoal,
        ),
        bodyLarge: outfitFont.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textCharcoal,
        ),
        bodyMedium: outfitFont.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: textGrey,
        ),
        labelLarge: outfitFont.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: textGrey,
        ),
      ),
    );
  }
}
