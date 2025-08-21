import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/widgets/custom_expandable_tile.dart';
import 'package:secret_box/widgets/custom_security_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3859C5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/xbutton.svg',
                      color: Colors.white,
                      height: 16,
                      width: 16,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              CustomExpandableTile(
                title: "Language",
                options: [
                  "English",
                  "Turkce",
                  "Spanish",
                  "Nederlands",
                  "Francais",
                  "Italiana",
                   "Polskie",
                  "Svenska",
                  "Potugues",
                   "Gaeilge",
                  "Pyccknn",
                  "Norsk",
                  "Bulgarian",
                  "Finnish",
                ],
              ),

              const Divider(color: Colors.white24, thickness: 1),
              CustomSecurityTile(),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Account",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "123@gmail.com",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Sign Out",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Terms And Conditions",
                style: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
