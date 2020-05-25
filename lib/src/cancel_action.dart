import 'package:flutter/material.dart';

class CancelAction {
  final String title;
  final VoidCallback onPressed;

  CancelAction({@required this.title, this.onPressed});
}
