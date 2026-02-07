import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/common/widgets/button.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/common/widgets/label_underline_text_field.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/helper/email_sender.dart';
import 'package:portfolio/helper/responsive.dart';
import 'package:portfolio/helper/toast_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ContactTitle(), SizedBox(height: 20), ContactDetails()],
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

class ContactDetails extends StatefulWidget {
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<double>> _fadeAnimations = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _scaleAnimations = [];
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _projectController = TextEditingController();
  String? nameError;
  String? emailError;
  String? messageError;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Create 4 staggered animations (3 fields + 1 button)
    for (int i = 0; i < 4; i++) {
      final delay = i * 0.12; // 120ms stagger

      _fadeAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 0.5 + delay, curve: Curves.easeOut),
          ),
        ),
      );

      _slideAnimations.add(
        Tween<Offset>(begin: const Offset(0.3, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 0.5 + delay, curve: Curves.easeOutCubic),
          ),
        ),
      );

      _scaleAnimations.add(
        Tween<double>(begin: 0.95, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 0.6 + delay, curve: Curves.easeOut),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _projectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('contact-details'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _controller.forward();
        }
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnimatedField(
              index: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledUnderlineTextField(
                    controller: _nameController,
                    hint: '',
                    label: 'Name',
                    labelColor: AppColors.lightPink,
                  ),
                  if (nameError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 75),
                      child: Text(
                        nameError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildAnimatedField(
              index: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledUnderlineTextField(
                    controller: _emailController,
                    hint: '',
                    label: 'Your Email',
                    labelColor: AppColors.lightOrange,
                  ),
                  if (emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 75),
                      child: Text(
                        emailError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildAnimatedField(
              index: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledUnderlineTextField(
                    controller: _projectController,
                    hint: '',
                    label: 'About Project',
                    labelColor: AppColors.lightBlue,
                  ),
                  if (messageError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 75),
                      child: Text(
                        messageError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildAnimatedField(
              index: 3,
              child: SButton(
                text: 'Send Here',
                onTap: () async {
                  if (_validateForm()) {
                    try {
                      await EmailSender.sendEmail({
                        'name': _nameController.text.trim(),
                        'email': _emailController.text.trim(),
                        'message': _projectController.text.trim(),
                        'time': DateFormat(
                          'yyyy-MM-dd HH:mm:ss',
                        ).format(DateTime.now()),
                      });
                      if (mounted && context.mounted) {
                        ToastHelper.showSuccess(
                          context,
                          '👋 Email sent—let’s connect soon.',
                        );
                      }
                      _nameController.clear();
                      _emailController.clear();
                      _projectController.clear();
                    } catch (err) {
                      if (mounted && context.mounted) {
                        ToastHelper.showError(
                          context,
                          'Something went wrong, try again please',
                        );
                      }
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  bool _validateForm() {
    bool isValid = true;
    setState(() {
      nameError = null;
      emailError = null;
      messageError = null;
    });

    // Validate name
    if (_nameController.text.trim().isEmpty) {
      setState(() {
        nameError = 'Name is required';
      });
      isValid = false;
    } else if (_nameController.text.trim().length < 2) {
      setState(() {
        nameError = 'Name must be at least 2 characters';
      });
      isValid = false;
    }

    // Validate email
    if (_emailController.text.trim().isEmpty) {
      setState(() {
        emailError = 'Email is required';
      });
      isValid = false;
    } else if (!_isValidEmail(_emailController.text.trim())) {
      setState(() {
        emailError = 'Please enter a valid email';
      });
      isValid = false;
    }

    // Validate message/project
    if (_projectController.text.trim().isEmpty) {
      setState(() {
        messageError = 'Project details are required';
      });
      isValid = false;
    }

    return isValid;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  Widget _buildAnimatedField({required int index, required Widget child}) {
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: SlideTransition(
        position: _slideAnimations[index],
        child: ScaleTransition(scale: _scaleAnimations[index], child: child),
      ),
    );
  }
}

class ContactTitle extends StatefulWidget {
  const ContactTitle({super.key});

  @override
  State<ContactTitle> createState() => _ContactTitleState();
}

class _ContactTitleState extends State<ContactTitle>
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
    return VisibilityDetector(
      key: const Key('contact-title'),
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
              child: HighlightText('Contact Me', fontSize: 20),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedBuilder(
            animation: _arrowRotateAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: -math.pi / 2 * _arrowRotateAnimation.value,
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
              'Have a project idea or want to hire me? Just say me Hi.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<void> sendEmail({
//   required String name,
//   required String email,
//   required String message,
// }) async {
//   final Uri uri = Uri(
//     scheme: 'mailto',
//     path: 'hameedsahul046@gmail.com',
//     query: Uri.encodeFull(
//       'subject=Portfolio Contact from $name'
//       '&body=Name: $name\nEmail: $email\nMessage:\n$message',
//     ),
//   );

//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   }
// }
