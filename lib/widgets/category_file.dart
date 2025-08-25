import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CategoryFile extends StatelessWidget {
  final String iconPath;
  final String title;
  final int count;
  final VoidCallback? onTap; 

  const CategoryFile({
    required this.iconPath,
    required this.title,
    required this.count,
    this.onTap,
  });

  static const _blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 332,
      margin: const EdgeInsets.only(right: 30, left: 28, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap, 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(iconPath, height: 21, width: 17),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xFF898989),
                    ),
                  ),
                ),
                Text(
                  '$count',
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: _blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
