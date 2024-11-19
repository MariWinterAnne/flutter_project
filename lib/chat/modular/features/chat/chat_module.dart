import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data/repository/theme_repository_impl.dart';
import 'presentation/state/cubits/app_theme_cubit.dart';
import 'presentation/state/cubits/chat_details_cubit.dart';
import 'presentation/state/cubits/chats_cubit.dart';
import 'presentation/screens/details_screen.dart';
import 'presentation/screens/root_view_screen.dart';
import 'data/repository/chat_repository_impl.dart';

class ChatModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ChatRepositoryImpl.new);
    i.addSingleton(ThemeRepositoryImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ChatsCubit(
              repository: Modular.get<ChatRepositoryImpl>(),
            ),
          ),
          BlocProvider(
            create: (_) => AppThemeCubit(
              repository: Modular.get<ThemeRepositoryImpl>(),
            ),
          ),
        ],
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
        child: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => ChatDetailsCubit(
                    repository: Modular.get<ChatRepositoryImpl>(),
                    chatId: int.parse(r.args.params['chatId']),
                  ),
                ),
                BlocProvider(
                  create: (_) => AppThemeCubit(
                    repository: Modular.get<ThemeRepositoryImpl>(),
                  ),
                ),
              ],
              child: const DetailsScreen(),
            ),
        transition: TransitionType.rightToLeft);
  }
}
