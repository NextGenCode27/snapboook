import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S N A P B O O O K',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const Scaffold(),
    );
  }
}
