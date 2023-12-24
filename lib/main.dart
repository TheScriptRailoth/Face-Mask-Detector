import 'package:flutter/material.dart';
import 'package:mast_detector/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Color(0xff132136)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
