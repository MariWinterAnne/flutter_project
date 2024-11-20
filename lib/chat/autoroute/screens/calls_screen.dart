import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';

@RoutePage()
class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkPrimaryColor,
        title: const Text(
          'Calls',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
