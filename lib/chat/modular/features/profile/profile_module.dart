import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../chat/data/repository/chat_repository_impl.dart';
import '../chat/data/repository/theme_repository_impl.dart';
import '../chat/presentation/screens/details_screen.dart';
import '../chat/presentation/screens/root_view_screen.dart';
import '../chat/presentation/state/cubits/app_theme_cubit.dart';
import '../chat/presentation/state/cubits/chat_details_cubit.dart';
import '../chat/presentation/state/cubits/chats_cubit.dart';

class ProfileModule extends Module {
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
        ChildRoute(
          '/details/:chatId',
          child: (context) => BlocProvider(
            create: (_) => ChatDetailsCubit(
              repository: Modular.get<ChatRepositoryImpl>(),
              chatId: int.parse(
                r.args.params['chatId'],
              ),
            ),
            child: const DetailsScreen(),
          ),
          transition: TransitionType.custom,
          customTransition: CustomTransition(
            transitionBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
            transitionDuration: const Duration(seconds: 1),
          ),
        ),
      ],
    );

    r.child(
      '/chatDetails/:chatId',
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
      duration: const Duration(seconds: 1),
      transition: TransitionType.size,
    );
  }
}
