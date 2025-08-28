import 'package:flutter/material.dart';
import 'package:secret_box/screens/contact_detail_page.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.name,
    required this.phone,
    this.sizeText = "311 KB",
    this.onTap,
    this.selectionMode = false,
    this.selected = false,
    this.onSelectedChanged,
  });

  final String name;
  final String phone;
  final String sizeText;
  final VoidCallback? onTap;

  final bool selectionMode;
  final bool selected;
  final ValueChanged<bool>? onSelectedChanged;

  static const blue = Color(0xFF3859C5);

  String _initials(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      final s = parts.first;
      return s.isEmpty ? '' : s.characters.first.toUpperCase();
    }
    return (parts[0].isNotEmpty ? parts[0][0] : '').toUpperCase() +
        (parts[1].isNotEmpty ? parts[1][0] : '').toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (selectionMode) {
          onSelectedChanged?.call(!selected);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ContactDetailPage(name: name, phone: phone),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 62,
              height: 68,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    _initials(name),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: blue,
                    ),
                  ),
                  const SizedBox(height: 2),

                  Text(
                    phone,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: blue.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(height: 2),

                  Text(
                    sizeText,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color: blue.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            if (selectionMode)
              Checkbox(
                value: selected,
                onChanged: (v) => onSelectedChanged?.call(v ?? false),
                activeColor: blue,
                shape: const CircleBorder(),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                  horizontal: -2,
                  vertical: -2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
