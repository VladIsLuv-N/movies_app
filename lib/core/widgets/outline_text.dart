import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fillColor;
  final Color outlineColor;
  final double strokeWidth;
  final FontWeight fontWeight;
  final String? fontFamily;

  const OutlineText({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.fillColor = Colors.white,
    this.outlineColor = Colors.black,
    this.strokeWidth = 3,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = outlineColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fillColor,
            fontFamily: fontFamily,
          ),
        ),
      ],
    );
  }
}
