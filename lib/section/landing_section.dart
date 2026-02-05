import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/button.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key, required this.contactKey});

  final Key contactKey;

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftLandingSection(),
          SizedBox(height: 20),
          RightLandingSection(contactKey: contactKey),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(child: LeftLandingSection()),
          const SizedBox(width: 50),
          Expanded(child: RightLandingSection(contactKey: contactKey)),
        ],
      );
    }
  }
}

class RightLandingSection extends StatefulWidget {
  const RightLandingSection({super.key, required this.contactKey});

  final Key contactKey;

  @override
  State<RightLandingSection> createState() => _RightLandingSectionState();
}

class _RightLandingSectionState extends State<RightLandingSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
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
      key: const Key('right-landing-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _controller.forward();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isMobile ? 0 : 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Text(
                  "I'll architect your application and develop robust backend systems using modern technologies.",
                  style: TextStyle(
                    height: 24 / 16,
                    fontSize: 18,
                    fontFamily: AppConstants.inter,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SButton(text: 'Hire Me', onTap: () {
                  scrollToContact(widget.contactKey);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftLandingSection extends StatefulWidget {
  const LeftLandingSection({super.key});

  @override
  State<LeftLandingSection> createState() => _LeftLandingSectionState();
}

class _LeftLandingSectionState extends State<LeftLandingSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

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
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.3, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
        );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.elasticOut),
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
    return VisibilityDetector(
      key: const Key('left-landing-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _controller.forward();
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(scale: _scaleAnimation, child: ProfilePicture()),
              SizedBox(height: 30),
              Text(
                'I build scalable software solutions',
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 40 / 32,
                  fontSize: 32,
                  fontFamily: AppConstants.inter,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 0.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -5.0), weight: 25),
      TweenSequenceItem(tween: Tween(begin: -5.0, end: 0.0), weight: 25),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotateAnimation = Tween<double>(
      begin: -0.1,
      end: 0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('profile-picture'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _controller.forward();
        }
      },
      child: Row(
        spacing: 10,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _bounceAnimation.value),
                child: child,
              );
            },
            child: SvgPicture.asset(
              'assets/images/profile.svg',
              width: 78,
              height: 78,
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotateAnimation.value,
                child: child,
              );
            },
            child: SvgPicture.asset('assets/icons/arrow.svg'),
          ),
          Transform.rotate(
            angle: -math.pi / 45,
            child: HighlightText('Sahul\nhameed', height: 50),
          ),
        ],
      ),
    );
  }
}

void scrollToContact(contactKey) {
  final context = contactKey.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0.1, // small top padding
    );
  }
}
