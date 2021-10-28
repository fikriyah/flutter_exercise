import 'package:flutter/material.dart';
import 'package:flutter_exercise/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sign-up Screen',
      home: MyHomepage(),
    );
  }
}
