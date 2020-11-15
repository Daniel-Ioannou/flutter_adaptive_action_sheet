import 'package:flutter/material.dart';

class CancelAction {
  final String title;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  CancelAction({
    @required this.title,
    this.onPressed,
    this.textStyle,
  });
}
