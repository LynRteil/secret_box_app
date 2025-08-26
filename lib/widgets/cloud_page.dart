import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/widgets/custom_bottom_navbar.dart';
import 'package:secret_box/widgets/custom_circular_indicator.dart';
import 'package:secret_box/widgets/media_selection_sheet.dart';
import 'package:secret_box/widgets/notifications_page.dart';
import 'package:secret_box/widgets/settings_page.dart';
import 'package:secret_box/widgets/storage_category_tile.dart';

class CloudPage extends StatelessWidget {
  const CloudPage({super.key});

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
            "Cloud",
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
                "assets/icons/notification_blue.svg",
                height: 18,
                width: 18,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, top: 30),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/settings.svg",
                height: 21,
                width: 21,
                color: const Color(0xFF3859C5),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            width: 330,
            height: 410,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularIndicator(
                  percent: 0.7,
                  usedText: "7 TB",
                  label: "Used",
                  width: 206,
                  height: 206,
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF777777).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "10 TB",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF3859C5),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Available",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF777777).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "3 TB",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF3859C5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const MediaSelectionSheet(action: "Backup"),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3859C5),
                        minimumSize: const Size(135, 48),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Backup",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const MediaSelectionSheet(action: "Restore"),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3859C5),
                        minimumSize: const Size(135, 48),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Restore",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            //check the height it should be wxpanded
            height: 410,
            width: 330,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            //size done
            child: Column(
              children: [
                StorageCategoryTile(
                  color: Color(0xFF9C27B0),
                  iconPath: "assets/images/pictures.svg",
                  title: "Pictures",
                  size: "1 TB",
                  subtitle: "52,470 Photos",
                  percent: 0.2,
                ),
                StorageCategoryTile(
                  color: Color(0xFF7BDE58),
                  iconPath: "assets/images/audios.svg",
                  title: "Audios",
                  size: "500 GB",
                  subtitle: "5,375 Audios",
                  percent: 0.1,
                ),
                StorageCategoryTile(
                  color: Color(0xFFE15555),
                  iconPath: "assets/images/videos.svg",
                  title: "Videos",
                  size: "4 TB",
                  subtitle: "19,632 Videos",
                  percent: 0.4,
                ),
                StorageCategoryTile(
                  color: Color(0xFFF98151),
                  iconPath: "assets/images/files.svg",
                  title: "Files",
                  size: "1 TB",
                  subtitle: "200,450 Files",
                  percent: 0.2,
                ),
                StorageCategoryTile(
                  color: Color(0xFFDF5DDF),
                  iconPath: "assets/images/contacts.svg",
                  title: "Contacts",
                  size: "500 GB",
                  subtitle: "20,923 Contacts",
                  percent: 0.1,
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
