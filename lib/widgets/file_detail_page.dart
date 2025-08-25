import 'package:flutter/material.dart';
import 'package:secret_box/widgets/show_confirm_sheet.dart';

class FileDetailPage extends StatelessWidget {
  const FileDetailPage({
    super.key,
    required this.title,
    required this.ext,
    this.onRestore,
    this.onDelete,
  });

  final String title;
  final String ext;
  final VoidCallback? onRestore;
  final VoidCallback? onDelete;

  static const blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    final bigMark = '.${ext.toLowerCase()}';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 12,
                      color: blue,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Text(
                bigMark,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w800,
                  fontSize: 133,
                  color: blue,
                  height: 1,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                minimum: const EdgeInsets.all(16),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: blue.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 18,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white.withOpacity(0.6),
                      ),

                      TextButton.icon(
                        onPressed: () async {
                          final ok = await showConfirmSheet(
                            context,
                            ext: ext,
                            action: FileAction.restore,
                          );
                          if (ok == true) onRestore?.call();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                        ),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Restore',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.restore, size: 16),
                          ],
                        ),
                        icon: const SizedBox(),
                      ),

                      TextButton.icon(
                        onPressed: () async {
                          final ok = await showConfirmSheet(
                            context,
                            ext: ext,
                            action: FileAction.delete,
                          );
                          if (ok == true) onDelete?.call();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                        ),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Delete',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.delete, size: 16),
                          ],
                        ),
                        icon: const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
