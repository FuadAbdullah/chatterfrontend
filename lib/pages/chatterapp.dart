import 'package:chatterapp/pages/homepage.dart';
import 'package:chatterapp/settings/theme_Data.dart';
import 'package:flutter/material.dart';

class ChatterApp extends StatelessWidget {
  const ChatterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatterApp - Personal ChatGPT AI',
      theme: chatterAppThemeData(),
      home: const ChatterAppHomePage(title: 'ChatterApp'),
    );
  }
}
