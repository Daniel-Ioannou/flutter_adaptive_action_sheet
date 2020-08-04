import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_action.dart';
import 'cancel_action.dart';

Future<T> showAdaptiveActionSheet<T>({
  @required BuildContext context,
  @required List<BottomSheetAction> actions,
  CancelAction cancelAction,
}) async {
  assert(context != null);
  assert(actions != null);
  return _show<T>(context, actions, cancelAction);
}

Future<T> _show<T>(
  BuildContext context,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
) {
  if (Platform.isIOS) {
    return _showCupertinoBottomSheet(context, actions, cancelAction);
  } else {
    return _showMaterialBottomSheet(context, actions, cancelAction);
  }
}

Future<T> _showCupertinoBottomSheet<T>(
  BuildContext context,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
) {
  final _textStyle = Theme.of(context).textTheme.headline6;
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext coxt) {
      return CupertinoActionSheet(
        actions: actions.map((action) {
          return CupertinoActionSheetAction(
            onPressed: action.onPressed,
            child: Text(
              action.title,
              // style: _textStyle,
            ),
          );
        }).toList(),
        cancelButton: cancelAction != null
            ? CupertinoActionSheetAction(
                onPressed:
                    cancelAction.onPressed ?? () => Navigator.of(coxt).pop(),
                child: Text(
                  cancelAction.title,
                  style: _textStyle.copyWith(color: Colors.lightBlue),
                ),
              )
            : null,
      );
    },
  );
}

Future<T> _showMaterialBottomSheet<T>(
  BuildContext context,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
) {
  final _textStyle = Theme.of(context).textTheme.headline6;
  return showModalBottomSheet<T>(
    context: context,
    elevation: 0,
    isScrollControlled: true,
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
              ...actions.map<Widget>((action) {
                return InkWell(
                  onTap: action.onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      action.title,
                      style: _textStyle,
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
                        style: _textStyle.copyWith(color: Colors.lightBlue),
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
