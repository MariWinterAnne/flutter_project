import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/screens/app_info.dart';
import 'presentation/screens/settings_screen.dart';

class SettingsModule extends Module {
  @override
  void binds(i) {
    //TODO
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SettingsScreen(), children: [
      ChildRoute(
        '/appInfo',
        child: (context) => const AppInfo(),
      ),
    ]);
  }
}
