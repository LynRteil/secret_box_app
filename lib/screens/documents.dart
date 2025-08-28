import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/screens/dashboard.dart';
import 'package:secret_box/widgets/check_option_section.dart';
import 'package:secret_box/widgets/custom_bottom_navbar.dart';
import 'package:secret_box/screens/files_page.dart';
import 'package:secret_box/screens/notifications_page.dart';
import 'package:secret_box/screens/settings_page.dart';
import 'package:secret_box/widgets/upload_options_bottom_sheet.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _FilesPageState();
}

class _FilesPageState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 164,
        titleSpacing: 10,
        scrolledUnderElevation: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 48, 15, 15),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF3859C5),
                  size: 15,
                ),
                onPressed: () => Navigator.pop(context),
              ),

              const Expanded(
                child: Text(
                  "Documents",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3859C5),
                  ),
                ),
              ),
            ],
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 40, bottom: 10),
            child: Row(
              children: [
                IconButton(
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
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/notification_blue.svg",
                    height: 21,
                    width: 21,
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
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/settings.svg",
                    height: 21,
                    width: 21,
                    color: const Color(0xFF3859C5),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    width: 272,
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Color(0xFF97A1B5)),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF3859C5),
                          size: 25,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFF3859C5),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xFF3859C5),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3859C5),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/menu.svg",
                        height: 19,
                        width: 20,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Material(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CheckOptionSection(onDone: (selected) {}),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Center(
        child: Text(
          'Tap the  +  button to importyour documents.',
          style: TextStyle(
            color: Color(0xFF777777).withOpacity(0.7),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 53,
        height: 53,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              ),
              builder: (_) => const UploadOptionsBottomSheet(),
            );
          },
          backgroundColor: const Color(0xFF3859C5),
          shape: const CircleBorder(),
          elevation: 0,
          child: SvgPicture.asset('assets/icons/add_floating_button.svg'),
        ),
      ),

   bottomNavigationBar: CustomBottomNavBar(
  currentIndex: 0, 
  onTap: (i) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => Dashboard(initialIndex: i)),
      (route) => false,
    );
  },
),
    );
  }
}
