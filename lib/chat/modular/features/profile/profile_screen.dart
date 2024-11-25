import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/custom_theme.dart';
import '../settings/presentation/state/app_theme_mode_state.dart';
import '../settings/presentation/state/cubits/app_theme_cubit.dart';
import 'widgets/checkbox.dart';
import 'widgets/dropdown_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeModeState>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: state.isDark == true ? ThemeMode.dark : ThemeMode.light,
          darkTheme: CustomTheme.darkTheme,
          theme: CustomTheme.lightTheme,
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
      },
    );
  }
}
