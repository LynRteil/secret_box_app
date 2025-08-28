import 'package:flutter/material.dart';
import 'package:secret_box/screens/cloud_page.dart';
import 'package:secret_box/widgets/custom_bottom_navbar.dart';
import 'package:secret_box/screens/files_page.dart';
import 'package:secret_box/screens/pro_user_page.dart';
import 'package:secret_box/screens/secret_web_page.dart';

class Dashboard extends StatefulWidget {
  final int initialIndex;
  const Dashboard({super.key, this.initialIndex = 0});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final PageController _pageController;
  late int _index;

  final _pages = const [
    FilesPage(),
    SecretWebPage(),
    CloudPage(),
    ProUserPage(),
  ];

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _pageController = PageController(initialPage: _index);
  }

  void _onTap(int i) {
    setState(() => _index = i);
    _pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _index,
        onTap: _onTap,
      ),
    );
  }
}
