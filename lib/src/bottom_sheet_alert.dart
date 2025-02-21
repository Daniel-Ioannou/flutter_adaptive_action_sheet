import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_action.dart';
import 'cancel_action.dart';

/// A action bottom sheet that adapts to the platform (Android/iOS).
///
/// [actions] The Actions list that will appear on the ActionSheet. (required)
///
/// [cancelAction] The optional cancel button that show under the
/// actions (grouped separately on iOS).
///
/// [title] The optional title widget that show above the actions.
///
/// [androidBorderRadius] The android border radius.
///
/// The optional [backgroundColor] and [barrierColor] can be passed in to
/// customize the appearance and behavior of persistent bottom sheets.
///
/// The optional [isDismissible] can be passed to set barrierDismissible of showCupertinoModalPopup
/// and isDismissible of showModalBottomSheet (Default true as for both implementations)
///
/// The optional [useRootNavigator] can be passed to set useRootNavigator of showCupertinoModalPopup
/// (Default true) and useRootNavigator of showModalBottomSheet (Default false)
Future<T?> showAdaptiveActionSheet<T>({
  required BuildContext context,
  Widget? title,
  required List<BottomSheetAction> actions,
  CancelAction? cancelAction,
  Color? barrierColor,
  Color? bottomSheetColor,
  double? androidBorderRadius,
  bool isDismissible = true,
  bool? useRootNavigator,
}) async {
  assert(
    barrierColor != Colors.transparent,
    'The barrier color cannot be transparent.',
  );

  return _show<T>(
    context,
    title,
    actions,
    cancelAction,
    barrierColor,
    bottomSheetColor,
    androidBorderRadius,
    isDismissible: isDismissible,
    useRootNavigator: useRootNavigator,
  );
}

Future<T?> _show<T>(
  BuildContext context,
  Widget? title,
  List<BottomSheetAction> actions,
  CancelAction? cancelAction,
  Color? barrierColor,
  Color? bottomSheetColor,
  double? androidBorderRadius, {
  bool isDismissible = true,
  bool? useRootNavigator,
}) {
  if (Platform.isIOS) {
    return _showCupertinoBottomSheet(
      context,
      title,
      actions,
      cancelAction,
      isDismissible: isDismissible,
      useRootNavigator: useRootNavigator,
    );
  } else {
    return _showMaterialBottomSheet(
      context,
      title,
      actions,
      cancelAction,
      barrierColor,
      bottomSheetColor,
      androidBorderRadius,
      isDismissible: isDismissible,
      useRootNavigator: useRootNavigator,
    );
  }
}

Future<T?> _showCupertinoBottomSheet<T>(
  BuildContext context,
  Widget? title,
  List<BottomSheetAction> actions,
  CancelAction? cancelAction, {
  bool isDismissible = true,
  bool? useRootNavigator,
}) {
  final defaultTextStyle =
      Theme.of(context).textTheme.titleLarge ?? const TextStyle(fontSize: 20);
  return showCupertinoModalPopup(
    context: context,
    barrierDismissible: isDismissible,
    useRootNavigator: useRootNavigator ?? true,
    builder: (BuildContext coxt) {
      return CupertinoActionSheet(
        title: title,
        actions: actions.map((action) {
          /// Modal Popup doesn't inherited material widget
          /// so need to provide one in case trailing or
          /// leading widget require a Material widget ancestor.
          return Material(
            color: Colors.transparent,
            child: CupertinoActionSheetAction(
              onPressed: () => action.onPressed(coxt),
              child: Row(
                children: [
                  if (action.leading != null) ...[
                    action.leading!,
                    const SizedBox(width: 15),
                  ],
                  Expanded(
                    child: DefaultTextStyle(
                      style: defaultTextStyle,
                      textAlign: action.leading != null
                          ? TextAlign.start
                          : TextAlign.center,
                      child: action.title,
                    ),
                  ),
                  if (action.trailing != null) ...[
                    const SizedBox(width: 10),
                    action.trailing!,
                  ],
                ],
              ),
            ),
          );
        }).toList(),
        cancelButton: cancelAction != null
            ? CupertinoActionSheetAction(
                onPressed: () {
                  if (cancelAction.onPressed != null) {
                    cancelAction.onPressed!(coxt);
                  } else {
                    Navigator.of(coxt).pop();
                  }
                },
                child: DefaultTextStyle(
                  style: defaultTextStyle.copyWith(color: Colors.lightBlue),
                  textAlign: TextAlign.center,
                  child: cancelAction.title,
                ),
              )
            : null,
      );
    },
  );
}

Future<T?> _showMaterialBottomSheet<T>(
  BuildContext context,
  Widget? title,
  List<BottomSheetAction> actions,
  CancelAction? cancelAction,
  Color? barrierColor,
  Color? bottomSheetColor,
  double? androidBorderRadius, {
  bool isDismissible = true,
  bool? useRootNavigator,
}) {
  final defaultTextStyle =
      Theme.of(context).textTheme.titleLarge ?? const TextStyle(fontSize: 20);
  final BottomSheetThemeData sheetTheme = Theme.of(context).bottomSheetTheme;
  return showModalBottomSheet<T>(
    context: context,
    elevation: 0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    isScrollControlled: true,
    backgroundColor: bottomSheetColor ??
        sheetTheme.modalBackgroundColor ??
        sheetTheme.backgroundColor,
    barrierColor: barrierColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(androidBorderRadius ?? 30),
        topRight: Radius.circular(androidBorderRadius ?? 30),
      ),
    ),
    useRootNavigator: useRootNavigator ?? false,
    builder: (BuildContext coxt) {
      final double screenHeight = MediaQuery.of(context).size.height;
      return SafeArea(
        child: PopScope(
          canPop: isDismissible,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeight - (screenHeight / 10),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (title != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(child: title),
                    ),
                  ],
                  ...actions.map<Widget>((action) {
                    return InkWell(
                      onTap: () => action.onPressed(coxt),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            if (action.leading != null) ...[
                              action.leading!,
                              const SizedBox(width: 15),
                            ],
                            Expanded(
                              child: DefaultTextStyle(
                                style: defaultTextStyle,
                                textAlign: action.leading != null
                                    ? TextAlign.start
                                    : TextAlign.center,
                                child: action.title,
                              ),
                            ),
                            if (action.trailing != null) ...[
                              const SizedBox(width: 10),
                              action.trailing!,
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                  if (cancelAction != null)
                    InkWell(
                      onTap: () {
                        if (cancelAction.onPressed != null) {
                          cancelAction.onPressed!(coxt);
                        } else {
                          Navigator.of(coxt).pop();
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: DefaultTextStyle(
                            style: defaultTextStyle.copyWith(
                              color: Colors.lightBlue,
                            ),
                            textAlign: TextAlign.center,
                            child: cancelAction.title,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
