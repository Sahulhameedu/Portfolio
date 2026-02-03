import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/experience_item.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/helper/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMobile || context.isTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(),
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: ExperienceList(),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 1, child: TitleSection()),
          const SizedBox(width: 100),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: ExperienceList(),
                ),
              ),
            ),
          ),
          const SizedBox(width: 50),
        ],
      );
    }
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final angle = context.isMobile ? -math.pi / 2 : -math.pi / 1.5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HighlightText('Work Experience', fontSize: 20),
        const SizedBox(height: 4),
        Transform.rotate(
          angle: angle,
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            width: 27,
            height: 27,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Have one year of experience',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class ExperienceList extends StatelessWidget {
  const ExperienceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: context.isMobile ? MainAxisSize.min : MainAxisSize.max,
      children: [
        ExperienceItem(
          index: 1,
          color: AppColors.lightOrange,
          title: 'MERN Stack Developer',
          company: ' at Camu',
          description: 'Worked on React js, Node js and MongoDB',
          date: 'Feb 2025 - Present',
        ),
        ExperienceItem(
          index: 2,
          color: AppColors.blue,
          title: 'Flutter Freelancer',
          company: ' during college',
          description: 'Worked as Flutter Freelancer for 1 year',
          date: 'Feb 2024 - 2025',
        ),
        ExperienceItem(
          index: 3,
          color: AppColors.pink,
          title: 'Flutter Developer Intern',
          company: ' at Merzol',
          description: 'Worked as Flutter Developer Intern',
          date: 'Jun 2025 - Jul 2025',
        ),
      ],
    );
  }
}
