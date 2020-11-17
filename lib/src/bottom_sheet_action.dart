import 'package:flutter/material.dart';

/// The Actions model that will use on the ActionSheet.
class BottomSheetAction {
  /// The string that will appear in the title bar of the action item. (required)
  final String title;

  /// The callback that is called when the action item is tapped. (required)
  final VoidCallback onPressed;

  /// The TextStyle to use for the title text. (optional)
  final TextStyle textStyle;

  BottomSheetAction({
    @required this.title,
    @required this.onPressed,
    this.textStyle,
  })  : assert(title != null),
        assert(onPressed != null);
}
