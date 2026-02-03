import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/common/widgets/skill_card.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/helper/responsive.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final angle = context.isDesktop ? -math.pi / 2 : -math.pi /1.5 ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HighlightText('What I do?', fontSize: 20),
        const SizedBox(height: 4),
        Transform.rotate(
          angle: angle,
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            width: 27,
            height: 27,
          ),
        ),
        const SizedBox(height: 25),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 25,
            children: [
              SkillCard(
                subColor: AppColors.lightOrange,
                tintAngle: 45,
                mainColor: AppColors.orange,
                highlightColor: AppColors.blue,
                description: 'Web Dev',
                title: 'React JS',
                leftPostion: -20,
                topPostion: 50,
                imagePath: 'assets/images/reactjs.png',
              ),
              SkillCard(
                subColor: AppColors.lightBlue,
                tintAngle: -32.8,
                mainColor: AppColors.blue,
                highlightColor: AppColors.pink,
                description: 'Mobile Dev',
                title: 'Flutter',
                leftPostion: -20,
                topPostion: 50,
                imagePath: 'assets/images/flutter.png',
              ),
              SkillCard(
                subColor: AppColors.lightPink,
                tintAngle: 38,
                mainColor: AppColors.pink,
                highlightColor: AppColors.orange,
                description: 'Backend',
                title: 'Node JS',
                leftPostion: -20,
                topPostion: 50,
                imagePath: 'assets/images/nodejs.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
