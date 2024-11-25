import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../modular/theme/colors.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPrimaryColor,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
