import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: RootRoute.page, children: [
          AutoRoute(
            page: ProfileRoute.page,
          ),
          AutoRoute(
            page: CallsRoute.page,
          ),
          AutoRoute(
            page: ChatsRoute.page,
          ),
          AutoRoute(
            page: SettingsRoute.page,
          ),
        ]),
        AutoRoute(
          page: DetailsRoute.page
        ),
      ];
}
