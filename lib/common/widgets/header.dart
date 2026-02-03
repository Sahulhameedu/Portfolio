import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            SvgPicture.asset('assets/icons/logo.svg', width: 27, height: 27),
            Text(
              'SahulHameed',
              style: TextStyle(
                fontSize: 20,
                fontFamily: AppConstants.handlee,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        // Navigation
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Portfolio",
              style: TextStyle(fontSize: 16, fontFamily: AppConstants.inter),
            ),
            HighlightText(
              "Hire Me",
              fontSize: 18,
              height: 5,
              fontWeight: FontWeight.w500,
              fontFamily: AppConstants.inter,
            ),
          ],
        ),
      ],
    );
  }
}
