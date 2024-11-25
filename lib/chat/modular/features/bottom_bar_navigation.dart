import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/custom_theme.dart';
import 'settings/presentation/state/app_theme_mode_state.dart';
import 'settings/presentation/state/cubits/app_theme_cubit.dart';
import 'calls/calls_screen.dart';
import 'chat/presentation/widgets/animated_menu_icon.dart';
import 'profile/profile_screen.dart';
import 'settings/presentation/screens/settings_screen.dart';
import '../utils/string_extensions.dart';
import 'chat/presentation/screens/chat_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    ProfileScreen(),
    CallsScreen(),
    ChatsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeModeState>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: state.isDark == true ? ThemeMode.dark : ThemeMode.light,
          darkTheme: CustomTheme.darkTheme,
          theme: CustomTheme.lightTheme,
          home: Scaffold(
            body: Center(child: _screens.elementAt(_selectedIndex)),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (int index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
              currentIndex: _selectedIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const AnimatedMenuIcon(icon: Icons.home),
                  label: empty(),
                ),
                BottomNavigationBarItem(
                  icon: const AnimatedMenuIcon(icon: Icons.call),
                  label: empty(),
                ),
                BottomNavigationBarItem(
                  icon: const AnimatedMenuIcon(icon: Icons.chat),
                  label: empty(),
                ),
                BottomNavigationBarItem(
                  icon: const AnimatedMenuIcon(icon: Icons.settings),
                  label: empty(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
