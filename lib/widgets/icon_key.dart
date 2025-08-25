import 'package:flutter/material.dart';


class IconKey extends StatelessWidget {
  const IconKey({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  static const blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Ink(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(icon, color: Color(0xFFF0F0F0), size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
