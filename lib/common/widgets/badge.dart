import 'package:flutter/material.dart';

class SBadge extends StatelessWidget {
  const SBadge({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF7AD9), Color(0xFFFF5CC3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          // Outer glow
          BoxShadow(
            color: const Color(0xFFFF5CC3).withAlpha(153),
            blurRadius: 25,
            spreadRadius: 5,
          ),
          // Inner soft shadow
          BoxShadow(
            color: Colors.white.withAlpha(102),
            blurRadius: 8,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
