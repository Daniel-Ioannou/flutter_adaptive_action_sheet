import 'package:flutter/material.dart';

class BottomSheetAction {
  final String title;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  BottomSheetAction({
    @required this.title,
    @required this.onPressed,
    this.textStyle,
  })  : assert(title != null),
        assert(onPressed != null);
}
