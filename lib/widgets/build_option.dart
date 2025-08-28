import 'package:flutter/material.dart';

class BuildOption extends StatelessWidget {
  final String title;
  final TextStyle style;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const BuildOption(
    this.title,
    this.style,
    this.value,
    this.onChanged, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        dense: true,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        activeColor: Colors.transparent,
        checkColor: Colors.white,
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(color: Colors.white, width: 1),
        ),
        title: Text(title, style: style),
      ),
    );
  }
}
