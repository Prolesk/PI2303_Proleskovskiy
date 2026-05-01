import 'package:flutter/material.dart';
import 'package:myapp/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Кофе машина', home: MainScreen());
  }
}
