import 'package:flutter/material.dart';
import 'pages/biens.pages.dart';
void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'SIO App location', home: BiensPage());
  }
}
