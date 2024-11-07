import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../domain/models/chat_data_model.dart';
import '../../theme/colors.dart';
import '../../widgets/avatars/avatar_icon_stack.dart';
import '../../widgets/tabbar/chats_even_list.dart';
import '../../widgets/tabbar/chats_list.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/tabbar/chats_odd_list.dart';

@RoutePage()
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatDataModel chatData = ChatDataModel();

    return DefaultTabController(
      initialIndex: 0,
      length: chatData.titles.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 130),
          child: AppBar(
            backgroundColor: AppColors.darkThemeColor,
            title: AvatarIconStack(
              chatDataList: chatData.chatDataList
                  .sublist(0, 3), // TODO: links передавать из слоя domain
            ),
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, kDefaultFontSize),
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
                        for (int i = 0; i < chatData.titles.length; i++)
                          SizedBox(
                            child: Tab(
                              height: 20,
                              child: Text(
                                chatData.titles[i],
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
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Action')));
                  },
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatsListView(chatDataList: chatData.chatDataList),
            ChatsEvenElementsListView(chatDataList: chatData.chatDataList),
            ChatsOddElementsListView(chatDataList: chatData.chatDataList),
          ],
        ),
      ),
    );
  }
}
