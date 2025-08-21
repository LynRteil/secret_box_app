import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;
  final Widget? extraWidget;
  final Widget? titleWidget;
  const OptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.titleWidget,
    this.extraWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleWidget != null
                  ? titleWidget!
                  : Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3859C5),
                        ),
                      ),
                    ),
                    //check the size of te swich
              SizedBox(
                width: 43,
                height: 24,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.diagonal3Values(50 / 59, 30 / 39, 1),
                  child: Switch(
                    value: value,
                    onChanged: onChanged,
                    thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                      (_) => null,
                    ),
                    thumbColor: MaterialStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      return states.contains(MaterialState.selected)
                          ? Colors.white
                          : const Color(0xFF3859C5);
                    }),
                    trackColor: MaterialStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      return states.contains(MaterialState.selected)
                          ? const Color(0xFF3859C5)
                          : Colors.white;
                    }),
                    trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        return states.contains(MaterialState.selected)
                            ? Colors.transparent
                            : const Color(0xFF3859C5);
                      },
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Gilroy",

              fontWeight: FontWeight.w400,
              color: const Color(0xFF3859C5).withOpacity(0.5),
            ),
          ),
          if (extraWidget != null) ...[
            const SizedBox(height: 12),
            extraWidget!,
          ],
        ],
      ),
    );
  }
}
