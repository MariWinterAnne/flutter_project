import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/colors.dart';
import '../../../widgets/avatars/avatar_icon_stack.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/tabbar/chats_even_list.dart';
import '../../../widgets/tabbar/chats_list.dart';
import '../../../widgets/tabbar/chats_odd_list.dart';
import '../../repository/chat_repository.dart';
import '../../state/chat_cubit.dart';
import '../../state/main_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(chatRepository: context.read<ChatRepository>()),
      child: Builder(
        builder: (context) {
          final state = context.watch<ChatCubit>().state;
          switch (state.loading) {
            case ChatScreenContentState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ChatScreenContentState.error:
              return const Center(
                child: Text('error'),
              );
            case ChatScreenContentState.idle:
            case ChatScreenContentState.success:
              return DefaultTabController(
                initialIndex: 0,
                length: state.result.chatDataList.length,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size(double.infinity, 130),
                    child: AppBar(
                      backgroundColor: AppColors.darkThemeColor,
                      title: AvatarIconStack(
                        chatDataList: state.result.chatDataList.sublist(0, 3),
                      ),
                      notificationPredicate: (ScrollNotification notification) {
                        return notification.depth == 1;
                      },
                      scrolledUnderElevation: 4.0,
                      shadowColor: Theme.of(context).shadowColor,
                      bottom: PreferredSize(
                        preferredSize:
                            const Size(double.infinity, kDefaultFontSize),
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
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                labelColor: AppColors.elementsColor,
                                indicatorColor: AppColors.elementsColor,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  for (int i = 0;
                                      i < state.result.titles.length;
                                      i++)
                                    SizedBox(
                                      child: Tab(
                                        height: 20,
                                        child: Text(
                                          state.result.titles[i],
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                ],
                                textScaler: TextScaler.noScaling,
                              ),
                            ),
                            Container(
                              color: AppColors.secondaryColor,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 20,
                              child: const Text('Archived chats',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                            )
                          ],
                        ),
                      ),
                      actions: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            color: AppColors.elementsColor,
                            icon: const Icon(Icons.edit_note),
                            onPressed: () {
                              context.read<ChatCubit>().sendRequest();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      if (state.result != '')
                        ChatsListView(chatDataList: state.result.chatDataList),
                      ChatsEvenElementsListView(
                          chatDataList: state.result.chatDataList),
                      ChatsOddElementsListView(
                          chatDataList: state.result.chatDataList),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
