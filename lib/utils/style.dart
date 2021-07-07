import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_projects/utils/colors.dart';

class MyStyle {
  MyStyle._();

  static TextStyle textStyle(
          {required double fontSize,
           Color color=MyColors.white,
          FontWeight? fontWeight = FontWeight.w600}) =>
      GoogleFonts.poppins(fontSize: fontSize, color: color, fontWeight: fontWeight);
}
