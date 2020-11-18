import 'package:flutter/material.dart';

/// The cancel actions model that show
/// under the [BottomSheetAction] (grouped separately on iOS).
class CancelAction {
  /// The string that will appear in the title bar of the cancel action. (required)
  final String title;

  /// The callback that is called when the action item is tapped.
  /// [onPressed] is optional by default will dismiss the Action Sheet.
  final VoidCallback onPressed;

  /// The TextStyle to use for the title text. (optional)
  final TextStyle textStyle;

  CancelAction({
    @required this.title,
    this.onPressed,
    this.textStyle,
  });
}
