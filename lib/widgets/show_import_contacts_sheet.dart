import 'package:flutter/material.dart';
import 'package:secret_box/models/contact.dart';
import 'package:secret_box/widgets/show_input_manually_sheet.dart';
import 'package:secret_box/widgets/show_select_Contacts_sheet.dart';

Future<void> showImportContactsSheet(BuildContext context) {
  const blue = Color(0xFF3859C5);

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return Container(
        height: 184,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Import Contacts",
              style: TextStyle(
                color: blue,
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
                      Navigator.of(ctx, rootNavigator: true).pop();
                      Future.microtask(() {
                        if (context.mounted) {
                          showInputManuallySheet(context);
                        }
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Input Manually",
                      style: TextStyle(color: blue, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx, rootNavigator: true).pop();

                      Future.microtask(() {
                        if (context.mounted) {
                          showSelectContactsSheet(
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
                      backgroundColor: blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
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
      );
    },
  );
}
