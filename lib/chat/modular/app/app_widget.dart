import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}