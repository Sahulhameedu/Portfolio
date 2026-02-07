import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ToolSection extends StatefulWidget {
  const ToolSection({super.key});

  @override
  State<ToolSection> createState() => _ToolSectionState();
}

class _ToolSectionState extends State<ToolSection>
    with TickerProviderStateMixin {
  late AnimationController _headerController;

  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _arrowRotateAnimation;

  bool _hasHeaderAnimated = false;

  @override
  void initState() {
    super.initState();

    // Header animations
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _headerController, curve: Curves.easeOut),
    );

    _headerSlideAnimation =
        Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _headerController, curve: Curves.easeOut),
        );

    _arrowRotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
      ),
    );
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = context.isDesktop ? -math.pi / 2 : -math.pi / 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated Header
        VisibilityDetector(
          key: const Key('tool-section-header'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.3 && !_hasHeaderAnimated) {
              _hasHeaderAnimated = true;
              _headerController.forward();
            }
          },
          child: FadeTransition(
            opacity: _headerFadeAnimation,
            child: SlideTransition(
              position: _headerSlideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HighlightText('What I use?', fontSize: 20),
                  const SizedBox(height: 4),
                  AnimatedBuilder(
                    animation: _arrowRotateAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: angle * _arrowRotateAnimation.value,
                        child: SvgPicture.asset(
                          'assets/icons/arrow.svg',
                          width: 27,
                          height: 27,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),

        // Animated Cards
        VisibilityDetector(
          key: const Key('tool-cards'),
          onVisibilityChanged: (info) {},
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: tools
                  .map(
                    (tool) => ToolWidget(
                      title: tool['name']!,
                      assetPath: tool['asset']!,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class ToolWidget extends StatelessWidget {
  const ToolWidget({super.key, required this.title, required this.assetPath});

  final String title;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> tools = [
  {"name": "HTML", "asset": "assets/icons/html.svg"},
  {"name": "CSS", "asset": "assets/icons/css.svg"},
  {"name": "Javascript", "asset": "assets/icons/javascript.svg"},
  {"name": "React JS", "asset": "assets/icons/react.svg"},
  {"name": "dart", "asset": "assets/icons/dart.svg"},
  {"name": "Node JS", "asset": "assets/icons/nodejs.svg"},
  {"name": "Flutter", "asset": "assets/icons/flutter.svg"},
  {"name": "MongoDB", "asset": "assets/icons/mongodb.svg"},
  {"name": "Android\nStudio", "asset": "assets/icons/android-studio.svg"},
  {"name": "Visual Studio", "asset": "assets/icons/vs-code.svg"},
  {"name": "Git", "asset": "assets/icons/git.svg"},
  {"name": "Github", "asset": "assets/icons/github.svg"},
];
