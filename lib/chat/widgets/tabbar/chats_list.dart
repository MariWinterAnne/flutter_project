import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import '../../autoroute/screens/details_screen.dart';
import '../../domain/models/chat_data_list_model.dart';
import '../../theme/colors.dart';
import '../list_item.dart';

class ChatsListView extends StatefulWidget {
  const ChatsListView({super.key, required this.chatDataList});

  final List<ChatDataListModel> chatDataList;

  @override
  ChatsListViewState createState() => ChatsListViewState();
}

class ChatsListViewState extends State<ChatsListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.chatDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            color: index == selectedIndex
                ? AppColors.elementsColor
                : AppColors.darkThemeColor,
            child: ChatListItem(
              linkUrl: widget.chatDataList[index].linkUrl,
              title: widget.chatDataList[index].title,
              subtitle: widget.chatDataList[index].subtitle,
              time: widget.chatDataList[index].time,
              messages: widget.chatDataList[index].unreadMessages,
            ),
          ),
          onTap: () {
            setState(
              () {
                selectedIndex = index;
              },
            );
            SplitView.of(context).popUntil(0);
            SplitView.of(context).push(
              DetailsScreen(
                  chatElement: widget.chatDataList[selectedIndex]),
            );
            //navigation with autoroute
            /*context.router.push(
                DetailsRoute(
                    chatElement: chatData.chatDataList[selectedIndex],
                    title: chatData.chatDataList[index].title),
              );*/
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 1,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
