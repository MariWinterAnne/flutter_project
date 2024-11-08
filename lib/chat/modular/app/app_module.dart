import 'package:flutter_modular/flutter_modular.dart';
import 'screens/chats_screen.dart';
import 'features/feed/feed_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const ChatsScreen());
    r.module('/feed', module: FeedModule());
  }
}