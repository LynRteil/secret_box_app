import 'package:flutter/material.dart';

class ChangePasscodePage extends StatefulWidget {
  const ChangePasscodePage({super.key});

  @override
  State<ChangePasscodePage> createState() => _ChangePasscodePageState();
}

class _ChangePasscodePageState extends State<ChangePasscodePage> {
  final _pinController = TextEditingController();

  void _onKeyTap(String value) {
    if (value == 'submit') {
      return;
    }
    if (_pinController.text.length < 6) {
      _pinController.text += value;
      setState(() {});
    }
  }

  void _backspace() {
    if (_pinController.text.isNotEmpty) {
      _pinController.text =
          _pinController.text.substring(0, _pinController.text.length - 1);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF3859C5);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: blue),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.chevron_left, size: 18),
                label: const Text(
                  'Back',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Enter Your Old Pin',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  color: Color(0xFF3859C5),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Your passcode will be used every time you enter the app and is designed to keep trespassers out.',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color(0xFF3859C5).withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 18),

              SizedBox(
                width: 330,   
                height: 48,     
                child: TextField(
                  controller: _pinController,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: blue, width: 2),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.backspace_outlined, color: blue),
                      onPressed: _backspace,
                      tooltip: 'Delete',
                    ),
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

              const SizedBox(height: 24),

              Expanded(
                child: Center(
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 18,
                    children: [
                      for (final n in ['1','2','3','4','5','6','7','8','9',''])
                        _NumButton(label: n, onTap: () => _onKeyTap(n)),
                      _NumButton(label: '0', onTap: () => _onKeyTap('0')),
                      _NumButton(
                        label: 'submit',
                        icon: Icons.arrow_forward,
                        onTap: () => _onKeyTap('submit'),
                        width: 64,
                        height: 52,
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

class _NumButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final double width;
  final double height;

  const _NumButton({
    required this.label,
    required this.onTap,
    this.icon,
    this.width = 74,  
    this.height = 64, 
  });

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF3859C5);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: blue.withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, color: Colors.white, size: 22)
              : Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
