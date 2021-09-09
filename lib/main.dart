import 'package:flutter/material.dart';
import 'package:translation_new/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: InputPage(),
    );
  }
}
