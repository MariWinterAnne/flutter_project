import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import '../../../main.dart';
import '../../theme/colors.dart';
import '../app/router.gr.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: appTheme,
      home: SplitView.material(
        child: AutoTabsScaffold(
          routes: const [
            ProfileRoute(),
            CallsRoute(),
            ChatsRoute(),
            SettingsRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              selectedItemColor: AppColors.elementsColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.account_circle,
                  ),
                  label: '',
                  backgroundColor: AppColors.darkPrimaryColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.call,
                  ),
                  label: '',
                  backgroundColor: AppColors.darkPrimaryColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.chat,
                  ),
                  label: '',
                  backgroundColor: AppColors.darkPrimaryColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  label: '',
                  backgroundColor: AppColors.darkPrimaryColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
