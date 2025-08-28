import 'package:flutter/material.dart';

const _blue = Color(0xFF3859C5);

enum FileAction { restore, delete }

class ConfirmSheet extends StatefulWidget {
  final String ext;           
  final FileAction action;     

  const ConfirmSheet({
    super.key,
    required this.ext,
    required this.action,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String ext,
    required FileAction action,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.white,
      builder: (ctx) => ConfirmSheet(ext: ext, action: action),
    );
  }

  @override
  State<ConfirmSheet> createState() => _ConfirmSheetState();
}

class _ConfirmSheetState extends State<ConfirmSheet> {
  bool _processing = false;

  String _typeWord(String e) {
    final x = e.toLowerCase();
    if (['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt'].contains(x)) return 'Document';
    if (['mp3', 'wav', 'm4a', 'aac', 'flac'].contains(x)) return 'Audio';
    if (['mp4', 'mov', 'avi', 'mkv'].contains(x)) return 'Video';
    if (['jpg', 'jpeg', 'png', 'gif', 'heic', 'webp'].contains(x)) return 'Photo';
    return 'File';
  }

  @override
  Widget build(BuildContext context) {
    final noun = _typeWord(widget.ext);
    final isRestore = widget.action == FileAction.restore;

    final title = '${isRestore ? 'Restore' : 'Delete'} $noun';
    final message =
        'Do you want to ${isRestore ? 'restore' : 'delete'} the selected ${noun.toLowerCase()} to your phone?';
    final cta = '${isRestore ? 'Restore' : 'Delete'} Asset';

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
              onPressed: _processing
                  ? null
                  : () async {
                     
                      if (mounted) Navigator.pop(context, true);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: _blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              child: _processing
                  ? const SizedBox(
                      height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
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
  }
}
