import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageCategoryTile extends StatelessWidget {
  final Color color;
  final String iconPath;
  final String title;
  final String size;
  final String subtitle;
  final double percent;

  const StorageCategoryTile({
    super.key,
    required this.color,
    required this.iconPath,
    required this.title,
    required this.size,
    required this.subtitle,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: SvgPicture.asset(iconPath, height: 52, width: 52),
            ),
          ),
          const SizedBox(width: 19),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3859C5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      size,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3859C5).withOpacity(0.5),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3859C5).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color(0xFF777777).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 8,
                          width: constraints.maxWidth * percent,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: color,
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.6),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
