import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/high_light_text.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class LabeledUnderlineTextField extends StatelessWidget {
  final String label;
  final Color labelColor;
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const LabeledUnderlineTextField({
    super.key,
    required this.label,
    required this.labelColor,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: HighlightText(
            label,
            fontSize: 16,
            isShowBorder: true,
            color: labelColor,
          ),
        ), // Add spacing between label and field
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            controller: controller, // Don't forget to use the controller
            maxLines: maxLines,
            cursorHeight: 16,
            style: const TextStyle(
              fontFamily: AppConstants.handlee,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              isDense: true,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
