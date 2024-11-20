import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const Center(
          child: Icon(Icons.settings),
        ),
      ),
    );
  }
}
