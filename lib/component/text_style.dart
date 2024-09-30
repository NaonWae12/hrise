import '/component/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle heading1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor1,
    ),
  );
  static TextStyle heading1_1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
  static TextStyle heading2 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
  static TextStyle heading3 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor3,
    ),
  );
  static TextStyle heading4 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor4,
    ),
  );
  static TextStyle heading4_1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor1,
    ),
  );
  static TextStyle heading5 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor4,
    ),
  );
  static TextStyle heading5_1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
    ),
  );
  static TextStyle displayText = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w300,
      color: AppColors.textColor1,
    ),
  );
  static TextStyle boldLabel = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor1,
    ),
  );
  static TextStyle smallLabel = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor4,
    ),
  );
  static TextStyle smallLabel_1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );

  static TextStyle inputField = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor1,
    ),
  );
}
