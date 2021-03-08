## [2.0.0] - 08 Mar 2021

* Migrated to null safety

## [1.1.0] - 22 Feb 2021

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

## [1.0.12] - 10 Feb 2021

*  Fix issues when trailing or leading widget require a Material widget ancestor.

## [1.0.11] - 20 Jan 2021

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
  
## [1.0.10] - 17 Jan 2021

* Support web platform 

## [1.0.9] - 16 Dec 2020

* [Android] Fix default material background color.
* [Android] Fix the padding on the top if title not set.
* [iOS] Use showCupertinoModalPopup instead of showModalBottomSheet

## [1.0.8] - 18 Nov 2020

* Update documentation.

## [1.0.7] - 16 Nov 2020
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
