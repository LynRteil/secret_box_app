import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/widgets/build_icon_box.dart';
import 'package:secret_box/screens/fake_pin_expandable_tile.dart';
import 'package:secret_box/screens/notifications_page.dart';
import 'package:secret_box/widgets/option_tile.dart';
import 'package:secret_box/screens/settings_page.dart';

class ProUserPage extends StatelessWidget {
  const ProUserPage({super.key});

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
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/starIcon.svg',
                height: 27,
                width: 28,
              ),
              const SizedBox(width: 8),
              const Text(
                "Pro User",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w800,

                  color: Color(0xFF3859C5),
                ),
              ),
            ],
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
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
              },
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
        const FakePinExpandableTile(),

          OptionTile(
            title: "Wrong Password Alert",
            subtitle:
                "Capture intruders with a discreet front image on the first wrong password attempt and sound the alarm on the second strike.",
            value: true,
            onChanged: (val) {},
          ),
          OptionTile(
            title: "Shake Action",
            subtitle:
                "A simple shake of your phone instantly closes the app, keeping your content safe and secure.",
            value: false,
            onChanged: (val) {},
          ),
          OptionTile(
            title: "App Icon",
            subtitle:
                "Transform your app’s icon into anything you desire, making it blend seamlessly with your device.",
            value: true,
            onChanged: (val) {},
            extraWidget: Column(
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: [
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/location.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/edit.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/music.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/video.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/contact.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/heart.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/bar.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/global.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/sheet.svg"),
                    ),
                    BuildIconBox(
                      image: SvgPicture.asset("assets/images/camera.svg"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC8C8C8),
                          minimumSize: const Size(0, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3859C5),
                          minimumSize: const Size(0, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

 
    );
  }

}
