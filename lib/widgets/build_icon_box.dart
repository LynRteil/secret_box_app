import 'package:flutter/material.dart';

class BuildIconBox extends StatelessWidget {
  final Widget image; 

  const BuildIconBox({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      width: 51,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: image),
    );
  }
}
