import 'package:flutter/material.dart';

class OptionItem {
  final String title;
  final String iconPath;
  final void Function(BuildContext context)? onPressed;

  const OptionItem(this.title, this.iconPath, {this.onPressed});
}
