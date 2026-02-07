import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:portfolio/main.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop || context.isTablet
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Logo(),
              // Navigation
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [LinkedInButton(), GithubButton()],
              ),
            ],
          )
        : Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Logo(),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [LinkedInButton(), GithubButton()],
              ),
            ],
          );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
