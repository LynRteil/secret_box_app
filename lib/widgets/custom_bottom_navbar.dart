import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 99,
      width: screenWidth,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 12,
                  offset: const Offset(0, -10),
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              elevation: 0,
              iconSize: 40,
              selectedItemColor: const Color(0xFF3859C5),
              unselectedItemColor: const Color(0xFF3859C5),
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF3859C5),
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF3859C5),
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset("assets/icons/files.svg", height: 28),
                      const SizedBox(height: 9),
                    ],
                  ),
                  label: "Files",
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset("assets/icons/secretWeb.svg", height: 28),
                      const SizedBox(height: 9),
                    ],
                  ),
                  label: "Secret Web",
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset("assets/icons/cloud.svg", height: 26),
                      const SizedBox(height: 9),
                    ],
                  ),
                  label: "Cloud",
                ),
                BottomNavigationBarItem(
                  icon: Transform.translate(
                    offset: const Offset(0, -5),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.center,
                        heightFactor: 0.5,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.scale(
                              scale: 2.2,
                              child: Lottie.asset(
                                'assets/lottie/proUser.json',
                                height: 70,
                                width: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              bottom: 18,
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3859C5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  label: 'Pro User',
                  tooltip: '',
                ),
              ],
              onTap: onTap,
            ),
          ),
          Positioned(
            top: 0,
            left: (screenWidth / 4) * currentIndex + (screenWidth / 8 - 20),
            child: Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF3859C5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
