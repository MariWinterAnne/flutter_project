import 'package:flutter/material.dart';
import 'calls/calls_screen.dart';
import 'chat/presentation/widgets/animated_menu_icon.dart';
import 'profile/profile_screen.dart';
import 'settings/settings_screen.dart';
import '../../theme/colors.dart';
import '../../theme/custom_theme.dart';
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
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: CustomTheme.darkTheme,
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        backgroundColor: AppColors.darkPrimaryColor,
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
  }
}
