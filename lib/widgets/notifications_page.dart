import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secret_box/widgets/files_page.dart';
import 'package:secret_box/widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 94,
        titleSpacing: 20,
        scrolledUnderElevation: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(10, 48, 15, 15),
          child: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 28,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w800,
              color: Color(0xFF3859C5),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 7, top: 30),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/apps_boxes_dashboard_menu_select_icon_with_color.svg",
                height: 18,
                width: 18,
              ),
              onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilesPage(),
                      ),
                    );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, top: 30),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/xbutton.svg",
                height: 12,
                width: 12,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: const NotificationCard(
                        title: 'Cloud Backup',
                        message:
                            'Lorem ipsum dolor sit amet,\nsadipscing elitr, sed diam nonumy',
                        time: '2:00PM',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
