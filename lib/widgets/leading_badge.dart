
import 'package:flutter/material.dart';

class LeadingBadge extends StatelessWidget {
  const LeadingBadge({required this.ext});
  final String ext;

  static const _blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 62,
      decoration: BoxDecoration(
        color: _blue,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: _blue.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        '.${ext.toLowerCase()}',
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: const TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: Colors.white,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
