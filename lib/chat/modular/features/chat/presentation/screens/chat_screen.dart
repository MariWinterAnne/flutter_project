import 'package:flutter/material.dart';
import '../../../../../theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../theme/custom_theme.dart';
import '../state/app_theme_mode_state.dart';
import '../state/chat_screen_state.dart';
import '../state/cubits/app_theme_cubit.dart';
import '../state/cubits/chats_cubit.dart';
import '../widgets/avatars/avatar_icon_stack.dart';
import '../widgets/search_bar.dart';
import '../widgets/tabbar/chats_even_list.dart';
import '../widgets/tabbar/chats_list.dart';
import '../widgets/tabbar/chats_odd_list.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatsScreen();
}

class _ChatsScreen extends State<ChatsScreen> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const selectedIndex = 2;
    const archivedChats = 'Archived chats';
    final screenWidth = MediaQuery.of(context).size.width;
    final path = screenWidth > 600 ? 'details' : 'chatDetails';
    return BlocBuilder<AppThemeCubit, AppThemeModeState>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: state.isDark == true ? ThemeMode.dark : ThemeMode.light,
          darkTheme: CustomTheme.darkTheme,
          theme: CustomTheme.lightTheme,
          home: Scaffold(
            appBar: AppBar(
              title: BlocBuilder<ChatsCubit, ChatScreenState>(
                builder: (context, state) {
                  return AvatarIconStack(
                    chatDataList: state.chatData.chatDataList.sublist(0, 3),
                  );
                },
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          left: 8,
                          bottom: 8,
                        ),
                        child: BlocBuilder<AppThemeCubit, AppThemeModeState>(
                          builder: (context, state) {
                            return const SearchBarApp();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      child: BlocBuilder<ChatsCubit, ChatScreenState>(
                        builder: (context, state) {
                          return TabBar(
                            controller: _controller,
                            isScrollable: true,
                            tabs: [
                              for (int i = 0;
                                  i < state.chatData.titles.length;
                                  i++)
                                SizedBox(
                                  child: Tab(
                                    height: 20,
                                    child: Text(
                                      state.chatData.titles[i],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                            ],
                            textScaler: TextScaler.noScaling,
                          );
                        },
                      ),
                    ),
                    BlocBuilder<AppThemeCubit, AppThemeModeState>(
                      builder: (context, state) {
                        return Container(
                          color: Theme.of(context).cardTheme.color,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 20,
                          child: Text(
                            archivedChats,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.greyColor,
                                    ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: BlocBuilder<AppThemeCubit, AppThemeModeState>(
                    builder: (context, state) {
                      return IconButton(
                        icon: state.isDark == true
                            ? const Icon(Icons.light_mode_outlined)
                            : const Icon(Icons.mode_night_outlined),
                        onPressed: () {
                          context
                              .read<AppThemeCubit>()
                              .updateAppTheme(!state.isDark);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            body: BlocBuilder<ChatsCubit, ChatScreenState>(
              builder: (context, state) {
                return TabBarView(
                  controller: _controller,
                  children: [
                    ChatsListView(
                      path: path,
                      chatDataList: state.chatData.chatDataList,
                    ),
                    ChatsEvenElementsListView(
                      path: path,
                      chatDataList: state.chatData.chatDataList,
                    ),
                    ChatsOddElementsListView(
                      path: path,
                      chatDataList: state.chatData.chatDataList,
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
