import 'package:flutter/material.dart';
import 'package:secret_box/models/contact.dart';
import 'package:secret_box/widgets/input_manually_sheet.dart';
import 'package:secret_box/widgets/select_contacts_sheet.dart';

const _blue = Color(0xFF3859C5);

class ImportContactsSheet extends StatefulWidget {
  const ImportContactsSheet({super.key});

  static Future<void> show(BuildContext parentContext) {
    return showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const ImportContactsSheet(),
    );
  }

  @override
  State<ImportContactsSheet> createState() => _ImportContactsSheetState();
}

class _ImportContactsSheetState extends State<ImportContactsSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Import Contacts",
            style: TextStyle(
              color: _blue,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Future.microtask(() {
                      if (mounted) {
                        InputManuallySheet.show(context);
                      }
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: _blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Input Manually",
                    style: TextStyle(color: _blue, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Future.microtask(() {
                      if (mounted) {
                        SelectContactsSheet.show(
                          context,
                          contacts: const [
                            Contact("Andrew Anderson", "+961 71 123 456"),
                            Contact("Benjamin Adams", "+961 71 342 632"),
                            Contact("Charlotte", "+961 03 592 591"),
                            Contact("Delilah hamouche", "+961 71 602 692"),
                            Contact("Elie hajj", "+961 79 592 928"),
                            Contact("Freya Williams", "+961 71 935 423"),
                            Contact("Georges Smith", "+961 71 834 732"),
                            Contact("Hector Doe", "+961 71 263 041"),
                            Contact("Imad Johnson", "+961 03 792 578"),
                            Contact("Johnny Rizk", "+961 71 602 692"),
                          ],
                        ).then((picked) {
                          if (picked != null && picked.isNotEmpty) {
                            debugPrint(
                              "Selected: ${picked.map((c) => c.name).join(", ")}",
                            );
                          }
                        });
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
