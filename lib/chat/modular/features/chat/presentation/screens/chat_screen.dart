import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../theme/colors.dart';
import '../state/chat_screen_state.dart';
import '../state/cubits/chats_cubit.dart';
import '../widgets/avatars/avatar_icon_stack.dart';
import '../widgets/search_bar.dart';
import '../widgets/tabbar/chats_list.dart';

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
    const archivedChats = 'Archived chats';
    final screenWidth = MediaQuery.of(context).size.width;
    final path = screenWidth > 600 ? 'details' : 'chatDetails';
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: BlocBuilder<ChatsCubit, ChatScreenState>(
                  builder: (context, state) {
                    return AvatarIconStack(
                      chatDataList: state.chatData.chatDataList.isNotEmpty
                          ? state.chatData.chatDataList.take(3).toList()
                          : [],
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
                          child: const SearchBarApp(),
                        ),
                      ),
                      SizedBox(
                        child: BlocBuilder<ChatsCubit, ChatScreenState>(
                          builder: (context, state) {
                            switch (state.loading) {
                              case ContentState.loading:
                                return const SizedBox();
                              case ContentState.success:
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
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                  ],
                                  textScaler: TextScaler.noScaling,
                                );
                              case ContentState.error:
                                return const SizedBox();
                            }
                          },
                        ),
                      ),
                      Container(
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
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      icon: const Icon(Icons.edit_note),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ];
          },
          body: BlocBuilder<ChatsCubit, ChatScreenState>(
            builder: (context, state) {
              switch (state.loading) {
                case ContentState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ContentState.success:
                  return TabBarView(
                    controller: _controller,
                    children: [
                      ChatsListView(
                        path: path,
                        chatDataList: state.chatData.chatDataList,
                      ),
                      ChatsListView(
                        path: path,
                        chatDataList: state.chatData.chatDataList
                            .where(
                              (element) =>
                                  element.type
                                      ?.any((el) => el.name == 'cartoons') ??
                                  false,
                            )
                            .toList(),
                      ),
                      ChatsListView(
                        path: path,
                        chatDataList: state.chatData.chatDataList
                            .where(
                              (element) =>
                                  element.type
                                      ?.any((el) => el.name == 'comedy') ??
                                  false,
                            )
                            .toList(),
                      ),
                    ],
                  );
                case ContentState.error:
                  return const Center(
                    child: Text('Произошла ошибка при загрузке данных.'),
                  );
              }
            },
        ),
      ),
    );
  }
}
