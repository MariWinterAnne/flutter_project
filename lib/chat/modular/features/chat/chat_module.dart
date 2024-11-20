import 'package:flutter_modular/flutter_modular.dart';
import '../../../autoroute/screens/chats_screen.dart';

class ChatModule extends Module {
  @override
  void binds(i) {
  }

  @override
  void routes(r) {
    r.child(
      '/chats',
      child: (context) => const ChatsScreen()
    );
  }
}
