import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'theme/custom_theme.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'features/splash/splash_screen.dart';

class ModularEntryWidget extends StatelessWidget {
  const ModularEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    setupSplash();
    return ModularApp(
      module: AppModule(),
      child: MaterialApp(
        darkTheme: CustomTheme.darkTheme,
        theme: CustomTheme.lightTheme,
        home: const SplashScreen(),
        routes: {
          '/home': (BuildContext context) => const ChatApp(),
        },
      ), //const ChatApp(),
    );
  }
}
