import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  static const blue = Color(0xFF3859C5);

  final List<TextEditingController> _ctrs =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _nodes = List.generate(6, (_) => FocusNode());
  bool _filled = false;

  @override
  void initState() {
    super.initState();
    for (final c in _ctrs) {
      c.addListener(_checkFilled);
    }
  }

  @override
  void dispose() {
    for (final c in _ctrs) {
      c.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _checkFilled() {
    setState(() {
      _filled = _ctrs.every((c) => c.text.trim().isNotEmpty);
    });
  }

  void _onChanged(int index, String value) {

    if (value.length > 1) {
      _ctrs[index].text = value.substring(value.length - 1);
      _ctrs[index].selection = TextSelection.collapsed(offset: 1);
    }
    if (value.isNotEmpty && index < 5) {
      _nodes[index + 1].requestFocus();
    }
  }

  void _onKey(int index, RawKeyEvent e) {
    if (e is RawKeyDownEvent &&
        e.logicalKey == LogicalKeyboardKey.backspace &&
        _ctrs[index].text.isEmpty &&
        index > 0) {
      _nodes[index - 1].requestFocus();
      _ctrs[index - 1].text = '';
    }
  }

  String get code => _ctrs.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 24, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 16, color: blue),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Check Your Email',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color: blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left:50),
                child: Text(
                  'Enter the 6-digit verification code',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: blue.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(height: 90),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (i) {
                  return Padding(
                    padding: EdgeInsets.only(right: i == 5 ? 0 : 12),
                    child: SizedBox(
                      width: 42,
                      height: 48,
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (e) => _onKey(i, e),
                        child: TextField(
                          controller: _ctrs[i],
                          focusNode: _nodes[i],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),
                          ],
                          onChanged: (v) => _onChanged(i, v),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: blue, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: blue, width: 2),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: blue,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 200),

              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _filled
                      ? () {
                         Navigator.pushNamed(context, '/setnewpassword');
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return blue.withOpacity(0.5);
                      }
                      return blue;
                    }),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white.withOpacity(0.6);
                      }
                      return Colors.white;
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
