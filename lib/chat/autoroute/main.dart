import 'package:flutter/material.dart';
import 'app/router.dart';

class AutoRouteEntryWidget extends StatelessWidget {
  const AutoRouteEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
