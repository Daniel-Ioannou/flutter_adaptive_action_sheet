import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive action sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive action sheet example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                showAdaptiveActionSheet(
                  context: context,
                  actions: <BottomSheetAction>[
                    BottomSheetAction(
                      title: const Text('Item 1'),
                      onPressed: () {},
                    ),
                    BottomSheetAction(
                      title: const Text('Item 2'),
                      onPressed: () {},
                    ),
                    BottomSheetAction(
                      title: const Text('Item 3'),
                      onPressed: () {},
                    ),
                  ],
                  cancelAction: CancelAction(title: 'Cancel'),
                );
              },
              child: const Text('Show action sheet'),
            ),
            RaisedButton(
              onPressed: () {
                showAdaptiveActionSheet(
                  context: context,
                  title: const Text('This is the title'),
                  actions: <BottomSheetAction>[
                    BottomSheetAction(
                      title: const Text('Item 1'),
                      onPressed: () {},
                    ),
                    BottomSheetAction(
                      title: const Text('Item 2'),
                      onPressed: () {},
                    ),
                    BottomSheetAction(
                      title: const Text('Item 3'),
                      onPressed: () {},
                    ),
                  ],
                  cancelAction: CancelAction(title: 'Cancel'),
                );
              },
              child: const Text('Show action sheet with title'),
            ),
            RaisedButton(
              onPressed: () {
                showAdaptiveActionSheet(
                  context: context,
                  actions: <BottomSheetAction>[
                    BottomSheetAction(
                      title: const Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                      leading: const Icon(Icons.add, size: 25),
                    ),
                    BottomSheetAction(
                      title: const Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {},
                      leading: const Icon(
                        Icons.delete,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                  ],
                  cancelAction: CancelAction(
                    title: 'Cancel',
                  ),
                );
              },
              child: const Text('Show action sheet with icons'),
            ),
          ],
        ),
      ),
    );
  }
}
