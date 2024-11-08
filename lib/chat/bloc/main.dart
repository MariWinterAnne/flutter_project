import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/ChatScreen/chat_screen.dart';
import 'repository/chat_repository.dart';

class BlocEntryWidget extends StatelessWidget {
  const BlocEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => ChatRepository()),
        ],
        child: const ChatScreen(),
      ),
    );
  }
}