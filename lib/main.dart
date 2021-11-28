import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test/home.dart';

void main() {
  runApp(MyApp());
}

final random = Random();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flashing lights',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home() //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
