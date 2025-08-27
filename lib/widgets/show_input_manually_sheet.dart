import 'package:flutter/material.dart';

Future<void> showInputManuallySheet(BuildContext context) {
  const blue = Color(0xFF3859C5);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool answerIt = true;
  bool muteIt = false;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (ctx, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
               
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Input Manually",
                    style: TextStyle(
                      color: blue,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: blue, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: blue, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: blue, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: blue, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Incoming call action",
                    style: TextStyle(
                      color: blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: answerIt,
                        onChanged: (v) => setState(() => answerIt = v ?? false),
                        checkColor: blue,
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(color: blue, width: 1),
                        ),
                      ),

                      const Text(
                        "Answer It",
                        style: TextStyle(
                          color: blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Checkbox(
                        value: muteIt,
                        onChanged: (v) => setState(() => muteIt = v ?? false),
                        checkColor: blue,
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(color: blue, width: 1),
                        ),
                      ),

                      const Text(
                        "Mute It",
                        style: TextStyle(
                          color: blue,
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
                          onPressed: () => Navigator.pop(ctx),
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blue,
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
        },
      );
    },
  );
}
