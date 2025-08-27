import 'package:flutter/material.dart';

Future<void> showImportSuccess(BuildContext context) {
  const blue = Color(0xFF3859C5);

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
     
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            const Text(
              "Successfully Imported !",
              style: TextStyle(
                color: blue,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
             Text(
              "Do you want to delete the original files\nfrom Files ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: blue.withOpacity(0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFC8C8C8),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Delete",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Keep",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
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
