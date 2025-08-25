import 'package:flutter/material.dart';


class KeypadRow extends StatelessWidget {
  final List<Widget> children;
  const KeypadRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        children[0],
        const SizedBox(width: 25),
        children[1],
        const SizedBox(width: 25),
        children[2],
      ],
    );
  }
}

