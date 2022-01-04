# Adaptive action sheet

[![pub package](https://img.shields.io/pub/v/adaptive_action_sheet.svg)](https://pub.dev/packages/adaptive_action_sheet)

A action bottom sheet that adapts to the platform (Android/iOS).

| iOS                                                                                                                                                         | Android                                                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <img width="520" alt="n1" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_adaptive_action_sheet/master/assets/ReadMe%20iOS%20Screenshot.png"> | <img width="497" alt="n2" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_adaptive_action_sheet/master/assets/ReadMe%20Android%20Screenshot.png"> |

## Getting Started

Add the package to your pubspec.yaml:

```yaml
adaptive_action_sheet: ^2.0.1
```

In your dart file, import the library:

```Dart
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
```

Instead of using a `showModalBottomSheet` use `showAdaptiveActionSheet` Widget:

```Dart
showAdaptiveActionSheet(
 context: context,
 title: const Text('Title'),
 androidBorderRadius: 30,
 actions: <BottomSheetAction>[
    BottomSheetAction(title: const Text('Item 1'), onPressed: () {}),
    BottomSheetAction(title: const Text('Item 2'), onPressed: () {}),
    BottomSheetAction(title: const Text('Item 3'), onPressed: () {}),
 ],
 cancelAction: CancelAction(title: const Text('Cancel')),// onPressed parameter is optional by default will dismiss the ActionSheet
);
```

### Parameters:

#### showAdaptiveActionSheet:

- `actions`: The Actions list that will appear on the ActionSheet. (required)
- `cancelAction`: The optional cancel button that show under the actions (grouped separately on iOS).
- `title`: The optional title widget that show above the actions.
- `androidBorderRadius`: The android border radius (default: 30).
- `isDismissible`: Specifies whether the bottom sheet will be dismissed when user taps outside of the bottom sheet. It is `true` by default and cannot be `null`.
- The optional `backgroundColor` and `barrierColor` can be passed in to customize the appearance and behavior of persistent material bottom sheets(Android only).

#### BottomSheetAction:

- `title`: The primary content of the action sheet item. (required)
- `onPressed`: The callback that is called when the action item is tapped. (required)
- `leading`: A widget to display before the title. Typically an Icon widget. (optional)
- `trailing`: A widget to display after the title. Typically an Icon or a CircleAvatar widget. (optional)

#### CancelAction:

- `title`: The primary content of the cancel action sheet item. (required)
- `onPressed`: The callback that is called when the action item is tapped. `onPressed` is optional by default will dismiss the Action Sheet.
