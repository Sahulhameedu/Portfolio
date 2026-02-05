import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/dotted_background_painter.dart';
import 'package:portfolio/common/widgets/header.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:portfolio/section/contact_section.dart';
import 'package:portfolio/section/experience_section.dart';
import 'package:portfolio/section/landing_section.dart';
import 'package:portfolio/section/project_section.dart';
import 'package:portfolio/section/skill_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      home: const MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMainContent(context),
            const Divider(color: Colors.black, thickness: 2, height: 2),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _buildSidePadding(context),
          const VerticalDivider(color: Colors.black, thickness: 2, width: 2),
          Expanded(
            child: RepaintBoundary(
              child: CustomPaint(
                painter: DottedBackgroundPainter(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 20),
                      Header(),
                      SizedBox(height: 80),
                      LandingSection(),
                      SizedBox(height: 80),
                      SkillSection(),
                      SizedBox(height: 80),
                      ProjectSection(),
                      SizedBox(height: 80),
                      ExperienceSection(),
                      SizedBox(height: 80),
                      ContactSection(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _buildSidePadding(context),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: context.isDesktop
                ? 100
                : context.isTablet
                ? 50
                : 10,
          ),
          const VerticalDivider(color: Colors.black, thickness: 2, width: 2),
          Expanded(
            child: CustomPaint(
              painter: DottedBackgroundPainter(),
              child: Padding(
                padding: EdgeInsets.all(context.isDesktop ? 50 : 20),
                child: context.isMobile
                    ? const Column(
                        children: [
                          SizedBox(height: 30),
                          Logo(),
                          SizedBox(height: 20),
                          Links(),
                          SizedBox(height: 30),
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Logo(), Links()],
                      ),
              ),
            ),
          ),
          SizedBox(
            width: context.isDesktop
                ? 100
                : context.isTablet
                ? 50
                : 10,
          ),
        ],
      ),
    );
  }

  Widget _buildSidePadding(BuildContext context) {
    return SizedBox(
      width: context.isDesktop
          ? 100
          : context.isTablet
          ? 50
          : 10,
    );
  }
}

class Links extends StatelessWidget {
  const Links({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 20,
      children: [
        HighlightText(
          'LinkedIn',
          fontSize: 18,
          height: 20,
          fontWeight: FontWeight.w500,
          fontFamily: AppConstants.handlee,
          color: Colors.black,
          textColor: Colors.white,
        ),
        HighlightText(
          'GitHub',
          fontSize: 18,
          height: 20,
          fontWeight: FontWeight.w500,
          fontFamily: AppConstants.handlee,
          color: Colors.black,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
