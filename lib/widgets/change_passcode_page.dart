import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasscodePage extends StatefulWidget {
  const ChangePasscodePage({super.key});

  @override
  State<ChangePasscodePage> createState() => _ChangePasscodePageState();
}

class _ChangePasscodePageState extends State<ChangePasscodePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 35, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: blue,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.chevron_left, size: 18),
                  label: const Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Enter Your Old Pin',
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
                      color: blue.withOpacity(
                        0.1,
                      ), 
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
                      _KeypadRow(
                        children: [
                          _Key('1', onTap: () => _onKeyTap('1')),
                          _Key('2', onTap: () => _onKeyTap('2')),
                          _Key('3', onTap: () => _onKeyTap('3')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      _KeypadRow(
                        children: [
                          _Key('4', onTap: () => _onKeyTap('4')),
                          _Key('5', onTap: () => _onKeyTap('5')),
                          _Key('6', onTap: () => _onKeyTap('6')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      _KeypadRow(
                        children: [
                          _Key('7', onTap: () => _onKeyTap('7')),
                          _Key('8', onTap: () => _onKeyTap('8')),
                          _Key('9', onTap: () => _onKeyTap('9')),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: _Key.size),
                          const SizedBox(width: 30),
                          _Key('0', onTap: () => _onKeyTap('0')),
                          const SizedBox(width: 45),
                          _IconKey(
                            icon: Icons.arrow_forward_rounded,
                            onTap: () => _onKeyTap('submit'),
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

class _KeypadRow extends StatelessWidget {
  final List<Widget> children;
  const _KeypadRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        children[0],
        const SizedBox(width: 25),
        children[1],
        const SizedBox(width: 25),
        children[2],
      ],
    );
  }
}

class _Key extends StatelessWidget {
  static const double size = 70;
  const _Key(this.label, {required this.onTap});

  final String label;
  final VoidCallback onTap;

  static const blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Ink(
        width: size,
        height: 70,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w300,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _IconKey extends StatelessWidget {
  const _IconKey({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  static const blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Ink(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(icon, color: Color(0xFFF0F0F0), size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
