import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/custom_theme.dart';
import '../state/cubits/app_theme_cubit.dart';
import 'webview.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppThemeCubit>().state;
    return MaterialApp(
      themeMode: state.isDark == true ? ThemeMode.dark : ThemeMode.light,
      darkTheme: CustomTheme.darkTheme,
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
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
        body: const WebViewApp(),//const WebViewExample(),
      ),
    );
  }
}
