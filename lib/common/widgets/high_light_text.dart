import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class HighlightText extends StatelessWidget {
  final String text;
  final double height;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color color;
  final bool isShowBorder;
  final Color textColor;

  const HighlightText(
    this.text, {
    super.key,
    this.height = 18,
    this.fontSize = 40,
    this.fontFamily = AppConstants.handlee,
    this.fontWeight = FontWeight.w600,
    this.color = AppColors.pink,
    this.isShowBorder = false,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // Highlight background
        Positioned(
          bottom: 6,
          child: Container(
            height: height,
            width: text.length * 20,
            decoration: BoxDecoration(
              color: color,
              border: isShowBorder
                  ? Border(left: BorderSide(width: 2, color: Colors.black))
                  : null,
            ),
          ),
        ),

        // Text
        Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
