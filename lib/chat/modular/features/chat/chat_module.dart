import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/state/cubits/chat_details_cubit.dart';
import 'presentation/state/cubits/chats_cubit.dart';
import 'presentation/screens/details_screen.dart';
import 'presentation/screens/root_view_screen.dart';
import 'data/chat_repository_impl.dart';

class ChatModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ChatRepositoryImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => BlocProvider(
        create: (_) => ChatsCubit(
          repository: Modular.get<ChatRepositoryImpl>(),
        ),
        child: const RootViewScreen(),
      ),
      children: [
        ChildRoute('/details/:chatId',
            child: (context) => BlocProvider(
                  create: (_) => ChatDetailsCubit(
                    repository: Modular.get<ChatRepositoryImpl>(),
                    chatId: int.parse(r.args.params['chatId']),
                  ),
                  child: const DetailsScreen(),
                ),
            transition: TransitionType.noTransition),
      ],
    );

    r.child('/chatDetails/:chatId',
        child: (context) => BlocProvider(
              create: (_) => ChatDetailsCubit(
                repository: Modular.get<ChatRepositoryImpl>(),
                chatId: int.parse(r.args.params['chatId']),
              ),
              child: const DetailsScreen(),
            ),
        transition: TransitionType.rightToLeft);
  }
}
