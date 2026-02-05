import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/common/widgets/skill_card.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillSection extends StatefulWidget {
  const SkillSection({super.key});

  @override
  State<SkillSection> createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _cardsController;

  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _arrowRotateAnimation;

  final List<Animation<double>> _cardFadeAnimations = [];
  final List<Animation<double>> _cardScaleAnimations = [];
  final List<Animation<Offset>> _cardSlideAnimations = [];

  bool _hasHeaderAnimated = false;
  bool _hasCardsAnimated = false;

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

    // Card animations
    _cardsController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create 3 staggered card animations
    for (int i = 0; i < 3; i++) {
      final delay = i * 0.15; // Stagger delay

      _cardFadeAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _cardsController,
            curve: Interval(delay, 0.5 + delay, curve: Curves.easeOut),
          ),
        ),
      );

      _cardScaleAnimations.add(
        Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(
            parent: _cardsController,
            curve: Interval(delay, 0.6 + delay, curve: Curves.elasticOut),
          ),
        ),
      );

      _cardSlideAnimations.add(
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _cardsController,
            curve: Interval(delay, 0.5 + delay, curve: Curves.easeOut),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardsController.dispose();
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
          key: const Key('skill-section-header'),
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
                  HighlightText('What I do?', fontSize: 20),
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
          key: const Key('skill-cards'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.2 && !_hasCardsAnimated) {
              _hasCardsAnimated = true;
              _cardsController.forward();
            }
          },
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 25,
              runSpacing: 25,
              children: [
                _buildAnimatedCard(
                  index: 0,
                  card: SkillCard(
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
                ),
                _buildAnimatedCard(
                  index: 1,
                  card: SkillCard(
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
                ),
                _buildAnimatedCard(
                  index: 2,
                  card: SkillCard(
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedCard({required int index, required Widget card}) {
    return FadeTransition(
      opacity: _cardFadeAnimations[index],
      child: SlideTransition(
        position: _cardSlideAnimations[index],
        child: ScaleTransition(
          scale: _cardScaleAnimations[index],
          child: card,
        ),
      ),
    );
  }
}