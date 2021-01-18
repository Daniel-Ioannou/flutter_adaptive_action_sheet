import 'package:flutter/material.dart';

/// The Actions model that will use on the ActionSheet.
class BottomSheetAction {
  /// The string that will appear in the title bar of the action item. (required)
  final String title;

  /// The callback that is called when the action item is tapped. (required)
  final VoidCallback onPressed;

  /// The TextStyle to use for the title text. (optional)
  final TextStyle textStyle;

  /// How the title should be aligned horizontally.
  final TextAlign textAlign;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  final Widget trailing;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget leading;

  BottomSheetAction({
    @required this.title,
    @required this.onPressed,
    this.textStyle,
    this.textAlign,
    this.trailing,
    this.leading,
  })  : assert(title != null),
        assert(onPressed != null);
}
