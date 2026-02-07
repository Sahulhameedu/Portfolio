import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class SButton extends StatelessWidget {
  const SButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.borderColor,
  });
  final String text;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        elevation: 0,
        minimumSize: Size(200, 50),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: borderColor ?? Colors.black, width: 2),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          if (icon != null) icon!,
          Text(
            text,
            style: const TextStyle(
              height: 1.4,
              fontSize: 16,
              color: Colors.white,
              fontFamily: AppConstants.inter,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
