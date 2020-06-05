import 'package:flutter/material.dart';

class BottomSheetAction {
  final String title;
  final VoidCallback onPressed;

  BottomSheetAction({@required this.title, @required this.onPressed})
      : assert(title != null),
        assert(onPressed != null);
}
