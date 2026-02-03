import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/helper/responsive.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HighlightText('Featured Projects', fontSize: 20),
        const SizedBox(height: 4),
        Transform.rotate(
          angle: -math.pi / 2,
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            width: 27,
            height: 27,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Have build more than 5 projects in Flutter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),
        Center(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.start,
            spacing: 25,
            runSpacing: 25,
            children: [
              ProjectWidget(
                assetPath: 'assets/images/donation.jpeg',
                description: 'Donation Application',
                title: 'Firebase',
                bottonColor: AppColors.pink,
              ),
              ProjectWidget(
                assetPath: 'assets/images/kinder.png',
                description: 'Kinder Attendance Application',
                title: 'SQLite',
                bottonColor: AppColors.blue,
                imageFit: BoxFit.fitWidth,
              ),
              ProjectWidget(
                assetPath: 'assets/images/geofence.jpeg',
                description: 'PZE Application',
                title: 'Geofence',
                bottonColor: AppColors.orange,
                imageFit: BoxFit.fitHeight,
              ),
              ProjectWidget(
                assetPath: 'assets/images/rfid.jpg',
                description: 'PZE Rfid Application',
                title: 'RFID',
                bottonColor: AppColors.lightPink,
                imageFit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
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
      ),
      child: Column(
        children: [
          Expanded(
            flex: context.isMobile ? 3 : 5,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(assetPath, fit: imageFit),
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
                    description,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppConstants.handlee,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    backgroundColor: bottonColor,
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
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppConstants.inter,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
