import 'package:flutter/material.dart';

class CustomAppChip extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  const CustomAppChip({
    Key? key,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
