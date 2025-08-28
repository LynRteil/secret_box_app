import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secret_box/utils/popup_helper.dart';
import 'package:secret_box/widgets/Keypad_row.dart';
import 'package:secret_box/widgets/icon_key.dart';
import 'package:secret_box/widgets/key_button.dart';

class SecurityPin extends StatefulWidget {
  const SecurityPin({super.key});

  @override
  State<SecurityPin> createState() => _SecurityPinState();
}

class _SecurityPinState extends State<SecurityPin> {
  static const blue = Color(0xFF3859C5);
  static const pageBg = Color(0xFFF0F0F0);

  final _pinController = TextEditingController();

  void _onKeyTap(String value) {
    if (value == 'submit') {
      if (_pinController.text.length == 6) {}
      return;
    }
    if (_pinController.text.length < 6) {
      _pinController.text += value;
      HapticFeedback.selectionClick();
      setState(() {});
    }
  }

  void _backspace() {
    if (_pinController.text.isNotEmpty) {
      _pinController.text = _pinController.text.substring(
        0,
        _pinController.text.length - 1,
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showFaceIdPopup(
        context,
        message: 'Face ID Not Activated',
        iconAsset: 'assets/icons/face_id_icon.png',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 35, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Enter Your Security Pin',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  color: Color(0xFF3859C5),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Your passcode will be used every time you enter the app and it's designed to keep trespassers out.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: blue.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 330,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: blue, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: blue.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _pinController,
                          readOnly: true,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                            color: blue,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Delete',
                        onPressed: _backspace,
                        icon: const Icon(
                          Icons.backspace_outlined,
                          color: Color.fromARGB(255, 180, 177, 177),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 26),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KeypadRow(
                        children: [
                          KeyButton('1', onTap: () => _onKeyTap('1')),
                          KeyButton('2', onTap: () => _onKeyTap('2')),
                          KeyButton('3', onTap: () => _onKeyTap('3')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      KeypadRow(
                        children: [
                          KeyButton('4', onTap: () => _onKeyTap('4')),
                          KeyButton('5', onTap: () => _onKeyTap('5')),
                          KeyButton('6', onTap: () => _onKeyTap('6')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      KeypadRow(
                        children: [
                          KeyButton('7', onTap: () => _onKeyTap('7')),
                          KeyButton('8', onTap: () => _onKeyTap('8')),
                          KeyButton('9', onTap: () => _onKeyTap('9')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showFaceIdPopup(
                                context,
                                message: 'Face ID Not Activated',
                                iconAsset: 'assets/icons/face_id_icon.png',
                              );
                            },
                            child: Image.asset(
                              'assets/icons/face_id_icon.png',
                              width: 32,
                              height: 32,
                            ),
                          ),

                          const SizedBox(width: 30),
                          KeyButton('0', onTap: () => _onKeyTap('0')),
                          const SizedBox(width: 45),
                          IconKey(
                            icon: Icons.arrow_forward_rounded,
                            onTap: () {
                              Navigator.pushNamed(context, '/files');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
