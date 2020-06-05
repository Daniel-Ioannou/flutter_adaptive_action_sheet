# Adaptive action sheet

[![pub package](https://img.shields.io/pub/v/adaptive_action_sheet.svg)](https://pub.dev/packages/adaptive_action_sheet)

A action bottom sheet that adapts to the platform (Android/iOS).

iOS | Android
--- | ---
<img width="520" alt="n1" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_adaptive_action_sheet/master/assets/ReadMe%20iOS%20Screenshot.png"> | <img width="497" alt="n2" src="https://raw.githubusercontent.com/Daniel-Ioannou/flutter_adaptive_action_sheet/master/assets/ReadMe%20Android%20Screenshot.png">

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 adaptive_action_sheet: ^1.0.3
 ```
 
 In your dart file, import the library:

 ```Dart
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
 ``` 
  Instead of using a `showModalBottomSheet` use `showAdaptiveActionSheet` Widget:

  ```Dart
showAdaptiveActionSheet(
   context: context,
   actions: <BottomSheetAction>[
      BottomSheetAction(title: 'Item 1', onPressed: () {}),
      BottomSheetAction(title: 'Item 2', onPressed: () {}),
      BottomSheetAction(title: 'Item 3', onPressed: () {}),
   ],
   cancelAction: CancelAction(title: 'Cancel'),// onPressed parameter is optional by default will dismiss the ActionSheet
);
```

### Parameters:
#### showAdaptiveActionSheet:
* `actions`: The Actions list that will appear on the ActionSheet. (required)
* `cancelAction`: The optional cancel button that show under the actions (grouped separately on iOS).

#### BottomSheetAction:
* `title`: The string that will appear in the title bar of the action item. (required)
* `onPressed`: The callback that is called when the action item is tapped. (required)

#### CancelAction:
* `title`: The string that will appear in the title bar of the cancel action. (required)
* `onPressed`: The callback that is called when the action item is tapped. `onPressed` is optional by default will dismiss the Action Sheet.
