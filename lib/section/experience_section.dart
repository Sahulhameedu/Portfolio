import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/experience_item.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
          Expanded(flex: 3, child: AnimatedExperienceContainer()),
          const SizedBox(width: 50),
        ],
      );
    }
  }
}

class AnimatedExperienceContainer extends StatefulWidget {
  const AnimatedExperienceContainer({super.key});

  @override
  State<AnimatedExperienceContainer> createState() =>
      _AnimatedExperienceContainerState();
}

class _AnimatedExperienceContainerState
    extends State<AnimatedExperienceContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('experience-container'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _controller.forward();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
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
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  const TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _arrowRotateAnimation;
  late Animation<double> _subtitleFadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          ),
        );

    _arrowRotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
      ),
    );

    _subtitleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = context.isMobile ? -math.pi / 2 : -math.pi / 1.5;

    return VisibilityDetector(
      key: const Key('experience-title'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _controller.forward();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: HighlightText('Work Experience', fontSize: 20),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedBuilder(
            animation: _arrowRotateAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: angle * _arrowRotateAnimation.value,
                child: Opacity(
                  opacity: _arrowRotateAnimation.value.clamp(0, 1).toDouble(),
                  child: SvgPicture.asset(
                    'assets/icons/arrow.svg',
                    width: 27,
                    height: 27,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          FadeTransition(
            opacity: _subtitleFadeAnimation,
            child: Text(
              'Have one year of experience',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceList extends StatefulWidget {
  const ExperienceList({super.key});

  @override
  State<ExperienceList> createState() => _ExperienceListState();
}

class _ExperienceListState extends State<ExperienceList>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<double>> _fadeAnimations = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _scaleAnimations = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    // Create 3 staggered experience item animations
    for (int i = 0; i < 3; i++) {
      final delay = i * 0.15; // 150ms stagger between each item

      _fadeAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 0.5 + delay, curve: Curves.easeOut),
          ),
        ),
      );

      _slideAnimations.add(
        Tween<Offset>(begin: const Offset(-0.3, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 0.5 + delay, curve: Curves.easeOutCubic),
          ),
        ),
      );

      _scaleAnimations.add(
        Tween<double>(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 0.6 + delay, curve: Curves.easeOutBack),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('experience-list'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _controller.forward();
        }
      },
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: context.isMobile ? MainAxisSize.min : MainAxisSize.max,
        children: [
          _buildAnimatedExperience(
            index: 0,
            experience: ExperienceItem(
              index: 1,
              color: AppColors.lightOrange,
              title: 'MERN Stack Developer',
              company: ' at Camu',
              description: 'Worked on React js, Node js and MongoDB',
              date: 'Feb 2025 - Present',
            ),
          ),
          _buildAnimatedExperience(
            index: 1,
            experience: ExperienceItem(
              index: 2,
              color: AppColors.blue,
              title: 'Flutter Freelancer',
              company: ' during college',
              description: 'Worked as Flutter Freelancer for 1 year',
              date: 'Feb 2024 - 2025',
            ),
          ),
          _buildAnimatedExperience(
            index: 2,
            experience: ExperienceItem(
              index: 3,
              color: AppColors.pink,
              title: 'Flutter Developer Intern',
              company: ' at Merzol',
              description: 'Worked as Flutter Developer Intern',
              date: 'Jun 2025 - Jul 2025',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedExperience({
    required int index,
    required Widget experience,
  }) {
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: SlideTransition(
        position: _slideAnimations[index],
        child: ScaleTransition(
          scale: _scaleAnimations[index],
          child: experience,
        ),
      ),
    );
  }
}
