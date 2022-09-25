import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

Widget chipWidget(String? text, {Color? color}) {
  return Chip(
    label: Text(text ?? 'Action',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )),
    backgroundColor: color ?? Constants.COLOR6,
  );
}