// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_project/chat/autoroute/screens/calls_screen.dart'
    as _i1;
import 'package:flutter_project/chat/autoroute/screens/chats_screen.dart'
    as _i2;
import 'package:flutter_project/chat/autoroute/screens/details_screen.dart'
    as _i3;
import 'package:flutter_project/chat/autoroute/screens/profile_screen.dart'
    as _i4;
import 'package:flutter_project/chat/autoroute/screens/root_screen.dart' as _i5;
import 'package:flutter_project/chat/autoroute/screens/settings_screen.dart'
    as _i6;
import 'package:flutter_project/chat/domain/models/chat_data_list_model.dart'
    as _i9;

/// generated route for
/// [_i1.CallsScreen]
class CallsRoute extends _i7.PageRouteInfo<void> {
  const CallsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CallsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.CallsScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatsScreen]
class ChatsRoute extends _i7.PageRouteInfo<void> {
  const ChatsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatsScreen();
    },
  );
}

/// generated route for
/// [_i3.DetailsScreen]
class DetailsRoute extends _i7.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i8.Key? key,
    required _i9.ChatDataListModel chatElement,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            chatElement: chatElement,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i3.DetailsScreen(
        key: args.key,
        chatElement: args.chatElement,
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.chatElement,
  });

  final _i8.Key? key;

  final _i9.ChatDataListModel chatElement;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, chatElement: $chatElement}';
  }
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.RootScreen]
class RootRoute extends _i7.PageRouteInfo<void> {
  const RootRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.RootScreen();
    },
  );
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}
