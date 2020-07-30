import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

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
        child: RaisedButton(
          onPressed: () {
            showAdaptiveActionSheet(
              context: context,
              actions: <BottomSheetAction>[
                BottomSheetAction(title: 'Item 1', onPressed: () {}),
                BottomSheetAction(title: 'Item 2', onPressed: () {}),
                BottomSheetAction(title: 'Item 3', onPressed: () {}),
              ],
              cancelAction: CancelAction(title: 'Cancel'),
            );
          },
          child: const Text('Show action sheet'),
        ),
      ),
    );
  }
}
