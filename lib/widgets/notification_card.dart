import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  final bool selectionMode;
  final bool selected;
  final ValueChanged<bool> onSelectedChanged;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    this.selectionMode = false,
    this.selected = false,
    required this.onSelectedChanged,
    this.onTap,
  });

  static const blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: blue,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Color(0xFF777777),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                SizedBox(
                  width: 46,
                  height: 17,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      time,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF737373).withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:40,),
                if (selectionMode)
                  Checkbox(
                    value: selected,
                    onChanged: (v) => onSelectedChanged(v ?? false),
                    activeColor: blue,
                    shape: const CircleBorder(), 
                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
