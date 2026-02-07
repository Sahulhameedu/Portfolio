import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _projectsController;

  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _arrowRotateAnimation;
  late Animation<double> _subtitleFadeAnimation;

  final List<Animation<double>> _projectFadeAnimations = [];
  final List<Animation<double>> _projectScaleAnimations = [];
  final List<Animation<Offset>> _projectSlideAnimations = [];

  @override
  void initState() {
    super.initState();

    // Header animations
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _headerSlideAnimation =
        Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerController,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          ),
        );

    _arrowRotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
      ),
    );

    _subtitleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    // Project animations
    _projectsController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Create 4 staggered project animations
    for (int i = 0; i < 5; i++) {
      final delay = i * 0.12; // Stagger delay

      // Calculate end points and clamp to 1.0
      final fadeEnd = (0.5 + delay).clamp(0.0, 1.0);
      final scaleEnd = (0.6 + delay).clamp(0.0, 1.0);
      final slideEnd = (0.5 + delay).clamp(0.0, 1.0);

      _projectFadeAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _projectsController,
            curve: Interval(delay, fadeEnd, curve: Curves.easeOut),
          ),
        ),
      );

      _projectScaleAnimations.add(
        Tween<double>(begin: 0.85, end: 1.0).animate(
          CurvedAnimation(
            parent: _projectsController,
            curve: Interval(delay, scaleEnd, curve: Curves.easeOutBack),
          ),
        ),
      );

      _projectSlideAnimations.add(
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _projectsController,
            curve: Interval(delay, slideEnd, curve: Curves.easeOut),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _headerController.dispose();
    _projectsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated Header
        VisibilityDetector(
          key: const Key('project-section-header'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.3) {
              _headerController.forward();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _headerFadeAnimation,
                child: SlideTransition(
                  position: _headerSlideAnimation,
                  child: HighlightText('Featured Projects', fontSize: 20),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedBuilder(
                animation: _arrowRotateAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: -math.pi / 2 * _arrowRotateAnimation.value,
                    child: Opacity(
                      opacity: _arrowRotateAnimation.value
                          .clamp(0, 1)
                          .toDouble(),
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
                  'Have build more than 5 projects in Flutter',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),

        // Animated Projects
        VisibilityDetector(
          key: const Key('project-cards'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.15) {
              _projectsController.forward();
            }
          },
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.start,
              spacing: 25,
              runSpacing: 25,
              children: [
                _buildAnimatedProject(
                  index: 0,
                  project: ProjectWidget(
                    assetPath: 'assets/images/donation.jpeg',
                    description: 'Donation Application',
                    title: 'Firebase',
                    bottonColor: AppColors.pink,
                  ),
                ),
                _buildAnimatedProject(
                  index: 1,
                  project: ProjectWidget(
                    assetPath: 'assets/images/kinder.png',
                    description: 'Kinder Attendance Application',
                    title: 'SQLite',
                    bottonColor: AppColors.blue,
                    imageFit: BoxFit.fitWidth,
                  ),
                ),
                _buildAnimatedProject(
                  index: 2,
                  project: ProjectWidget(
                    assetPath: 'assets/images/geofence.jpeg',
                    description: 'PZE Application',
                    title: 'Geofence',
                    bottonColor: AppColors.orange,
                    imageFit: BoxFit.fitHeight,
                  ),
                ),
                _buildAnimatedProject(
                  index: 3,
                  project: ProjectWidget(
                    assetPath: 'assets/images/rfid.jpg',
                    description: 'PZE Rfid Application',
                    title: 'RFID',
                    bottonColor: AppColors.lightPink,
                    imageFit: BoxFit.fitWidth,
                  ),
                ),
                _buildAnimatedProject(
                  index: 4,
                  project: ProjectWidget(
                    assetPath: 'assets/images/splash screen.jpeg',
                    description: 'Call Recording Application',
                    title: 'Android',
                    bottonColor: AppColors.lightBlue,
                    imageFit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedProject({required int index, required Widget project}) {
    return FadeTransition(
      opacity: _projectFadeAnimations[index],
      child: SlideTransition(
        position: _projectSlideAnimations[index],
        child: ScaleTransition(
          scale: _projectScaleAnimations[index],
          child: project,
        ),
      ),
    );
  }
}

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    super.key,
    required this.assetPath,
    required this.description,
    required this.title,
    required this.bottonColor,
    this.imageFit = BoxFit.cover,
  });

  final String assetPath;
  final String description;
  final String title;
  final Color bottonColor;
  final BoxFit imageFit;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        constraints: BoxConstraints(
          maxWidth: 400,
          minWidth: 300,
          maxHeight: context.isMobile ? 250 : 400,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.black,
            width: 2,
            style: BorderStyle.solid,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.bottonColor.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Expanded(
              flex: context.isMobile ? 3 : 5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Image.asset(widget.assetPath, fit: widget.imageFit),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppConstants.handlee,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        backgroundColor: widget.bottonColor,
                        side: const BorderSide(width: 1, color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppConstants.inter,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
