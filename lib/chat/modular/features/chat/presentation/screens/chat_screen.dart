import 'package:flutter/material.dart';
import '../../../../../../main.dart';
import '../../../../../theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/chat_screen_state.dart';
import '../state/cubits/chats_cubit.dart';
import '../widgets/avatars/avatar_icon_stack.dart';
import '../widgets/search_bar.dart';
import '../widgets/tabbar/chats_even_list.dart';
import '../widgets/tabbar/chats_list.dart';
import '../widgets/tabbar/chats_odd_list.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedIndex = 2;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: appTheme,
      home: BlocBuilder<ChatsCubit, ChatScreenState>(
        builder: (context, state) {
          return DefaultTabController(
            initialIndex: 0,
            length: state.chatData.titles.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.darkThemeColor,
                title: AvatarIconStack(
                  chatDataList: state.chatData.chatDataList.sublist(0, 3),
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
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          labelColor: AppColors.elementsColor,
                          indicatorColor: AppColors.elementsColor,
                          unselectedLabelColor: Colors.grey,
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
                        ),
                      ),
                      Container(
                        color: AppColors.secondaryColor,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 20,
                        child: const Text(
                          'Archived chats',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  ChatsListView(
                      path: screenWidth > 600 ? 'details' : 'chatDetails',
                      chatDataList: state.chatData.chatDataList),
                  ChatsEvenElementsListView(
                      chatDataList: state.chatData.chatDataList),
                  ChatsOddElementsListView(
                      chatDataList: state.chatData.chatDataList),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: selectedIndex,
                selectedItemColor: AppColors.elementsColor,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_circle),
                    label: '',
                    backgroundColor: AppColors.darkThemeColor,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.call),
                    label: '',
                    backgroundColor: AppColors.darkThemeColor,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.chat),
                    label: '',
                    backgroundColor: AppColors.darkThemeColor,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: '',
                    backgroundColor: AppColors.darkThemeColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
