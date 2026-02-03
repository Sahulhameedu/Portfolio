import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final int index;
  final Color color;
  final String title;
  final String company;
  final String description;
  final String date;

  const ExperienceItem({
    super.key,
    required this.index,
    required this.color,
    required this.title,
    required this.company,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Number Box
        Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            index.toString(),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(width: 16),

        /// Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(
                    context,
                  ).style.copyWith(fontSize: 16),
                  children: [
                    TextSpan(text: title),
                    TextSpan(
                      text: company,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(description,softWrap: true, style: TextStyle(color: Colors.grey.shade700)),
              const SizedBox(height: 6),
              Text(
                date,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
