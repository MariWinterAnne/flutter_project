import 'package:flutter_modular/flutter_modular.dart';
import 'calls_screen.dart';

class CallsModule extends Module {
  @override
  void binds(i) {
    //TODO
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const CallsScreen(),
    );
  }
}