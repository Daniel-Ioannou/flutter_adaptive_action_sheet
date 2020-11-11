## [1.0.6] - 29 Oct 2020

* Add optional `title` parameter and will be displayed as title in the action sheet.
  ```Dart
  showAdaptiveActionSheet(
     context: context,
     title: const Text('Title'),
     actions: <BottomSheetAction>[
        BottomSheetAction(title: 'Item 1', onPressed: () {}),
        BottomSheetAction(title: 'Item 2', onPressed: () {}),
     ],
     cancelAction: CancelAction(title: 'Cancel'),// onPressed parameter is optional by default will dismiss the ActionSheet
  );
  ```
  
## [1.0.5] - 06 Oct 2020

* Add option to customize colors via bottomSheetColor and barrierColor.

## [1.0.4] - 04 Aug 2020

* Add scroll at material bottom sheet
* Fix overflow at android action sheet

## [1.0.3] - 05 Jun 2020

* Add required annotation for all the required parameters

## [1.0.2] - 25 May 2020

* Add options to customize cancel action.
* UMake cancel action optional.

## [1.0.1] - 20 May 2020

* Update documentation.

## [1.0.0] - 19 May 2020

* Initial developers preview release.
