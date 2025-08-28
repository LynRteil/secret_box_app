import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'package:secret_box/screens/files_page.dart';
import 'package:secret_box/screens/secret_web_page.dart';
import 'package:secret_box/screens/cloud_page.dart';
import 'package:secret_box/screens/pro_user_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const _blue = Color(0xFF3859C5);

  late final PageController _pageController;
  int _index = 0;

  final _pages = const [
    FilesPage(),
    SecretWebPage(),
    CloudPage(),
    ProUserPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int i) {
    setState(() => _index = i);
    _pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (i) => setState(() => _index = i),
      ),
      bottomNavigationBar: SizedBox(
        height: 99,
        width: screenWidth,
        child: Stack(
          children: [
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
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
                  currentIndex: _index,
                  elevation: 0,
                  iconSize: 40,
                  selectedItemColor: _blue,
                  unselectedItemColor: _blue,
                  selectedLabelStyle: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: _blue,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: _blue,
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
                                const Positioned(
                                  bottom: 18,
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: _blue,
                                    child: Icon(Icons.check, size: 10, color: Colors.white),
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
                  onTap: _onTap,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: (screenWidth / 4) * _index + (screenWidth / 8 - 20),
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: _blue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
