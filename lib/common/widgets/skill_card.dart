import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.tintAngle,
    required this.mainColor,
    required this.subColor,
    required this.highlightColor,
    required this.title,
    required this.description,
    this.leftPostion,
    this.rightPostion,
    this.topPostion,
    required this.imagePath,
  });

  final double tintAngle;
  final Color mainColor;
  final Color subColor;
  final Color highlightColor;
  final String title;
  final String description;
  final double? leftPostion;
  final double? rightPostion;
  final double? topPostion;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Transform.rotate(
        angle: -math.pi / tintAngle,
        child: Container(
          width: 260,
          height: 311,
          decoration: BoxDecoration(
            color: subColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              color: mainColor,
              width: 5,
            ),
            boxShadow: [
              BoxShadow(
                color: subColor.withAlpha(153),
                blurRadius: 20,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 59,
                left: 20,
                child: Column(
                  children: [
                    Image.asset(imagePath, width: 50, height: 50),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppConstants.handlee,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: topPostion,
                left: leftPostion,
                child: HighlightText(
                  description,
                  height: 50,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: highlightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
