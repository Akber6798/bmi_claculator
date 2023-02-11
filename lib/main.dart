import 'package:bmi_calculator/pages/home_page.dart';
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
      home: const HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0C1234),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF12153B),
            elevation: 10,
            centerTitle: true),
      ),
    );
  }
}
