import 'package:flutter/material.dart';
import 'package:secret_box/widgets/leading_badge.dart';

class FileItem extends StatelessWidget {
  const FileItem({
    super.key,
    required this.title,
    required this.date,
    required this.size,
    required this.ext,
    this.onTap,
    this.onMore,

    this.selectionMode = false,
    this.selected = false,
    this.onSelectedChanged,
  });

  final String title;
  final String date;
  final String size;
  final String ext;
  final VoidCallback? onTap;
  final VoidCallback? onMore;

  final bool selectionMode;
  final bool selected;
  final ValueChanged<bool>? onSelectedChanged;

  static const _blue = Color(0xFF3859C5);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (selectionMode) {
            onSelectedChanged?.call(!selected);
          } else {
            onTap?.call();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingBadge(ext: ext),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: _blue,
                            ),
                          ),
                        ),
                        if (onMore != null)
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.more_horiz, color: _blue, size: 20),
                            onPressed: onMore,
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: _blue.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      size,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: _blue.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),

              if (selectionMode) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => onSelectedChanged?.call(!selected),
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: _blue, width: 2),
                         color:  selected?  _blue:Colors.transparent,
                          ),
                        ),
                        if (selected)
                          const Icon(Icons.check, size: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
