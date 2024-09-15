import 'package:flutter/material.dart';
import 'package:contact_form_app/theme.dart';
import 'package:contact_form_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      title: 'Contact Form App',
      home: const HomeScreen(),
    );
  }
}
