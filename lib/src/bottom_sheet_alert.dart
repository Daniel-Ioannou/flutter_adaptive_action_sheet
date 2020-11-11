import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_action.dart';
import 'cancel_action.dart';

Future<T> showAdaptiveActionSheet<T>({
  @required BuildContext context,
  Widget title,
  @required List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color barrierColor,
  Color bottomSheetColor,
}) async {
  assert(context != null);
  assert(actions != null);
  assert(barrierColor != Colors.transparent, 'The barrier color cannot be transparent.');
  return _show<T>(context, title, actions, cancelAction, barrierColor, bottomSheetColor);
}

Future<T> _show<T>(
  BuildContext context,
  Widget title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color barrierColor,
  Color bottomSheetColor,
) {
  if (Platform.isIOS) {
    return _showCupertinoBottomSheet(context, title, actions, cancelAction, barrierColor, bottomSheetColor);
  } else {
    return _showMaterialBottomSheet(context, title, actions, cancelAction, barrierColor, bottomSheetColor);
  }
}

Future<T> _showCupertinoBottomSheet<T>(
  BuildContext context,
  Widget title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color bottomSheetColor,
  Color barrierColor,
) {
  final defaultTextStyle = Theme.of(context).textTheme.headline6;
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: bottomSheetColor ?? Colors.transparent,
    barrierColor: barrierColor,
    builder: (BuildContext coxt) {
      return CupertinoActionSheet(
        title: title,
        actions: actions.map((action) {
          return CupertinoActionSheetAction(
            onPressed: action.onPressed,
            child: Text(
              action.title,
              style: action.textStyle ?? defaultTextStyle,
            ),
          );
        }).toList(),
        cancelButton: cancelAction != null
            ? CupertinoActionSheetAction(
                onPressed:
                    cancelAction.onPressed ?? () => Navigator.of(coxt).pop(),
                child: Text(
                  cancelAction.title,
                  style: cancelAction.textStyle ?? defaultTextStyle.copyWith(color: Colors.lightBlue),
                ),
              )
            : null,
      );
    },
  );
}

Future<T> _showMaterialBottomSheet<T>(
  BuildContext context,
  Widget title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color barrierColor,
  Color bottomSheetColor,
) {
  final defaultTextStyle = Theme.of(context).textTheme.headline6;
  return showModalBottomSheet<T>(
    context: context,
    elevation: 0,
    isScrollControlled: true,
    backgroundColor: bottomSheetColor ?? Colors.white,
    barrierColor: barrierColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext coxt) {
      final double screenHeight = MediaQuery.of(context).size.height;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: screenHeight - (screenHeight / 10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: title),
              ),
              ...actions.map<Widget>((action) {
                return InkWell(
                  onTap: action.onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      action.title,
                      style: action.textStyle ?? defaultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              if (cancelAction != null)
                InkWell(
                  onTap:
                      cancelAction.onPressed ?? () => Navigator.of(coxt).pop(),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        cancelAction.title,
                        style: cancelAction.textStyle ?? defaultTextStyle.copyWith(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
