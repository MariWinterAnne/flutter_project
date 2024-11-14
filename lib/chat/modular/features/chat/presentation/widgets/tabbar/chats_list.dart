import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: widget.chatDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return ChatListItem(
          element: widget.chatDataList[index],
          path: widget.path,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 8,
      ),
    );
  }
}
