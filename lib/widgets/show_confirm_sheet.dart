import 'package:flutter/material.dart';

const _blue = Color(0xFF3859C5);

enum FileAction { restore, delete }

Future<bool?> showConfirmSheet(
  BuildContext context, {
  required String ext,          
  required FileAction action,
}) {
  String typeWord(String e) {
    final x = e.toLowerCase();
    if (['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt'].contains(x)) return 'Document';
    if (['mp3', 'wav', 'm4a', 'aac', 'flac'].contains(x)) return 'Audio';
    if (['mp4', 'mov', 'avi', 'mkv'].contains(x)) return 'Video';
    if (['jpg', 'jpeg', 'png', 'gif', 'heic', 'webp'].contains(x)) return 'Photo';
    return 'File';
  }

  final noun = typeWord(ext);
  final isRestore = action == FileAction.restore;

  final title = '${isRestore ? 'Restore' : 'Delete'} $noun';
  final message =
      'Do you want to ${isRestore ? 'restore' : 'delete'} the selected ${noun.toLowerCase()} to your phone ?';
  final cta = '${isRestore ? 'Restore' : 'Delete'} Asset';

  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.white,
   
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 22),
        child: Column(
          
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: _blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: _blue.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  cta,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
