import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../theme/colors.dart';
import '../../../domain/models/chat_data_list_model.dart';
import '../list_item.dart';

class ChatsListView extends StatefulWidget {
  const ChatsListView(
      {super.key, required this.chatDataList, required this.path});

  final List<ChatDataListModel> chatDataList;
  final String path;

  @override
  ChatsListViewState createState() => ChatsListViewState();
}

class ChatsListViewState extends State<ChatsListView> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.chatDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            color: index == _selectedIndex
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
                _selectedIndex = index;
              },
            );
            Modular.to.pushNamed('/${widget.path}/${widget.chatDataList[index].id}');
            /*SplitView.of(context).popUntil(0);
            SplitView.of(context).push(
              DetailsScreen(
                  chatElement: widget.chatDataList[selectedIndex]),
            );*/
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 1,
        height: 0,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
