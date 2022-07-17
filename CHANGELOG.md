## 2.0.2
* Add context to 'onPressed' for BottomSheetAction.
  ```Dart
  showAdaptiveActionSheet(
    context: context,
    title: const Text('Title'),
    actions: <BottomSheetAction>[
    BottomSheetAction(title: const Text('Item 1'), onPressed: (context) {}),
    BottomSheetAction(title: const Text('Item 2'), onPressed: (context) {}),
    BottomSheetAction(title: const Text('Item 3'), onPressed: (context) {}),
    ],
    cancelAction: CancelAction(title: const Text('Cancel')),// onPressed parameter is optional by default will dismiss the ActionSheet
  );
  ```
  
## 2.0.1
* Add `isDismissible` parameter that specifies whether the bottom sheet will be dismissed when user taps outside of the bottom sheet.
  ```Dart
  showAdaptiveActionSheet(
    context: context,
    isDismissible: false,
    actions: <BottomSheetAction>[
      BottomSheetAction(
        title: const Text('Item 1'),
        onPressed: () {},
      ),
      BottomSheetAction(
        title: const Text('Item 2'),
        onPressed: () {},
      ),  
    ],
    cancelAction: CancelAction(title: 'Cancel'),
  );
  ```

## 2.0.0

* Migrated to null safety

## 1.1.0

 #### Breaking change:
 * Change `title` type from String to Widget
 <table>
  <tr>
   <th>Version 1.1.0 or later</th>
   <th>Version 1.0.12 or earlier</th>
  </tr>
  <tr>
   <td>
     
  ```Dart
    BottomSheetAction(
      title: const Text(
        'Title',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {},
      leading: const Icon(Icons.add, size: 25),
    ),
   ```
   </td>
   <td>
   
   ```Dart
    BottomSheetAction(
      title: 'Title',
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      onPressed: () {},
      leading: const Icon(Icons.add, size: 25),
    ),
   ```
   </td>
  </tr>
 </table>

## 1.0.12

*  Fix issues when trailing or leading widget require a Material widget ancestor.

## 1.0.11

* Add options for leading and trailing widget
* Add options for text align
  ```Dart
  showAdaptiveActionSheet(
    context: context,
    actions: <BottomSheetAction>[
      BottomSheetAction(
        title: 'Add',
        onPressed: () {},
        leading: const Icon(
          Icons.add,
          size: 25,
        ),
        trailing: const Icon(
          Icons.delete,
          size: 25,
          color: Colors.red,
        ),
        textAlign: TextAlign.start,
      ),        
    ],
    cancelAction: CancelAction(title: 'Cancel'),
  );
  ```
  
## 1.0.10

* Support web platform 

## 1.0.9

* [Android] Fix default material background color.
* [Android] Fix the padding on the top if title not set.
* [iOS] Use showCupertinoModalPopup instead of showModalBottomSheet

## 1.0.8

* Update documentation.

## 1.0.7
* Add optional `textStyle` parameter for each action.
  ```Dart
  showAdaptiveActionSheet(
     context: context,
     actions: <BottomSheetAction>[
        BottomSheetAction(
           title: 'Item 1', 
           onPressed: () {}, 
           textStyle: const TextStyle(
              fontSize: 25,
              color: Colors.blueAccent,
           ),
        ),
        BottomSheetAction(title: 'Item 2', onPressed: () {}),
     ],
     cancelAction: CancelAction(// onPressed parameter is optional by default will dismiss the ActionSheet
        title: 'Cancel', 
        textStyle: const TextStyle(
           fontSize: 25,
           color: Colors.blueAccent,
        ),
     ),
  );
  ```

## 1.0.6

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
  
## 1.0.5

* Add option to customize colors via bottomSheetColor and barrierColor.

## 1.0.4

* Add scroll at material bottom sheet
* Fix overflow at android action sheet

## 1.0.3

* Add required annotation for all the required parameters

## 1.0.2

* Add options to customize cancel action.
* UMake cancel action optional.

## 1.0.1

* Update documentation.

## 1.0.0

* Initial developers preview release.
