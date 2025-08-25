import 'package:flutter/material.dart';


class KeyButton extends StatelessWidget {
  static const double size = 70;
  const KeyButton(this.label, {required this.onTap});

  final String label;
  final VoidCallback onTap;

  static const blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Ink(
        width: size,
        height: 70,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w300,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}