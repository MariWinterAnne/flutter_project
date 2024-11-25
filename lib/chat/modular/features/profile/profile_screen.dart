import 'package:flutter/material.dart';
import 'widgets/checkbox.dart';
import 'widgets/dropdown_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: //const ListDropdown(),
            const CheckBoxScreen(),
      ),
    );
  }
}
