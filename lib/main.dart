import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/dotted_background_painter.dart';
import 'package:portfolio/common/widgets/header.dart';
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
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        child: CustomPaint(
          painter: DottedBackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),

            child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Header
                Header(),
                SizedBox(height: 80),
                // Landing Section
                LandingSection(),
                SizedBox(height: 80),
                // What I Do Section
                SkillSection(),
                SizedBox(height: 80),
                // Projects Section
                ProjectSection(),

                SizedBox(height: 80),
                // Work Experience Section
                ExperienceSection(),
                SizedBox(height: 80),
                // Contact Section
                ContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
