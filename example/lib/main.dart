import 'package:flutter/material.dart';
import 'package:flutter_advanced_progress_example/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SmartOverPage(),
    );
  }
}
