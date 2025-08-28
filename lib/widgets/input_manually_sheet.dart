import 'package:flutter/material.dart';

const _blue = Color(0xFF3859C5);

class InputManuallySheet extends StatefulWidget {
  const InputManuallySheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const InputManuallySheet(),
    );
  }

  @override
  State<InputManuallySheet> createState() => _InputManuallySheetState();
}

class _InputManuallySheetState extends State<InputManuallySheet> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _answerIt = true;
  bool _muteIt = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Input Manually",
              style: TextStyle(
                color: _blue,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: _blue, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: _blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: _blue, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: _blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Incoming call action",
              style: TextStyle(
                color: _blue,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _answerIt,
                  onChanged: (v) => setState(() => _answerIt = v ?? false),
                  checkColor: _blue,
                  fillColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.transparent),
                  side: MaterialStateBorderSide.resolveWith(
                    (_) => const BorderSide(color: _blue, width: 1),
                  ),
                ),
                const Text(
                  "Answer It",
                  style: TextStyle(
                    color: _blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 20),
                Checkbox(
                  value: _muteIt,
                  onChanged: (v) => setState(() => _muteIt = v ?? false),
                  checkColor: _blue,
                  fillColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.transparent),
                  side: MaterialStateBorderSide.resolveWith(
                    (_) => const BorderSide(color: _blue, width: 1),
                  ),
                ),
                const Text(
                  "Mute It",
                  style: TextStyle(
                    color: _blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC8C8C8),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _blue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
