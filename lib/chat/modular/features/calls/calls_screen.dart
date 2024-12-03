import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/custom_theme.dart';
import '../settings/presentation/state/cubits/app_theme_cubit.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

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
            'Calls',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
        ),
      ),
    );
  }
}
