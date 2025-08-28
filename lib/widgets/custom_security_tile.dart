import 'package:flutter/material.dart';
import 'package:secret_box/screens/change_passcode_page.dart';

class CustomSecurityTile extends StatefulWidget {
  const CustomSecurityTile({super.key});

  @override
  State<CustomSecurityTile> createState() => _CustomSecurityTileState();
}

class _CustomSecurityTileState extends State<CustomSecurityTile> {
  bool biometricEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        title: const Text(
          "Security",
          style: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ChangePasscodePage(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(1),
                          child: Text(
                            "Change Passcode >",
                            style: TextStyle(
                              fontFamily: "Gilroy",
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 2),
                      Text(
                        "Update your passcode if you think someone has it.",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Color(0x80FFFFFF).withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enable Biometric Login",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.white.withOpacity(
                              biometricEnabled ? 1.0 : 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Set fingerprint or face recognition security for instant login.",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white.withOpacity(
                              biometricEnabled ? 0.5 : 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Switch(
                    value: biometricEnabled,
                    onChanged: (val) => setState(() => biometricEnabled = val),

                    thumbColor: MaterialStateProperty.all(Colors.white),

                    trackColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => states.contains(MaterialState.selected)
                          ? const Color(0xFF4FC3F7)
                          : Colors.transparent,
                    ),
                    trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => states.contains(MaterialState.selected)
                          ? const Color(0xFF4FC3F7)
                          : Colors.white,
                    ),

                    trackOutlineWidth: MaterialStateProperty.all(2),

                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
