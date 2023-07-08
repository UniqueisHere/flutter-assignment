import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final int? maxlines;
  final TextOverflow? overflow;

  const CustomizedText({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    this.maxlines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // minFontSize: 10,
      // maxFontSize: 12,
      maxLines: maxlines,
      overflow: overflow,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
