import 'package:flutter_modular/flutter_modular.dart';
import '../features/calls/calls_module.dart';
import '../features/chat/chat_module.dart';
import '../features/profile/profile_module.dart';
import '../features/settings/settings_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: ProfileModule());
    r.module('/calls', module: CallsModule());
    r.module('/chats', module: ChatModule());
    r.module('/settings', module: SettingsModule());
  }
}
