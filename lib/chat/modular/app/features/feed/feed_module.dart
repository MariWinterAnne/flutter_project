import 'package:flutter_modular/flutter_modular.dart';
import 'screens/details_screen.dart';
import 'repository/feed_repository.dart';

class FeedModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(FeedRepository.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const DetailsScreen());
  }
}
