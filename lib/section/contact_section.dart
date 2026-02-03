import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/button.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/common/widgets/label_underline_text_field.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/helper/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ContactTitle(), ContactDetails()],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(flex: 1, child: ContactTitle()),
          const SizedBox(width: 100),
          Flexible(flex: 3, child: ContactDetails()),
        ],
      );
    }
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledUnderlineTextField(
            controller: TextEditingController(),
            hint: '',
            label: 'Name',
            labelColor: AppColors.lightPink,
          ),
          SizedBox(height: 20),
          LabeledUnderlineTextField(
            controller: TextEditingController(),
            hint: '',
            label: 'Your Email',
            labelColor: AppColors.lightOrange,
          ),
          SizedBox(height: 20),
          LabeledUnderlineTextField(
            controller: TextEditingController(),
            hint: '',
            label: 'About Project',
            labelColor: AppColors.lightBlue,
          ),
          SizedBox(height: 20),
          SButton(text: 'Send Here'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ContactTitle extends StatelessWidget {
  const ContactTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HighlightText('Contact Me', fontSize: 20),
        const SizedBox(height: 4),
        Transform.rotate(
          angle: -math.pi / 2,
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            width: 27,
            height: 27,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Have a project idea or want to hire me? Just say me Hi.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
