import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/cubits/app_theme_cubit.dart';
import 'app_info.dart';
import 'webview.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppThemeCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AppInfo();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.info)),
          IconButton(
            icon: state.isDark == true
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.mode_night_outlined),
            onPressed: () {
              context.read<AppThemeCubit>().updateAppTheme(!state.isDark);
            },
          ),
        ],
      ),
      body: const WebViewApp(),
    );
  }
}
