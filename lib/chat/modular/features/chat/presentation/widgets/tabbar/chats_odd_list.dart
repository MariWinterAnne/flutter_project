import 'package:flutter/material.dart';
import '../../../domain/models/chat_data_list_model.dart';
import '../list_item.dart';

//TODO: все фильтры на domain-слое
class ChatsOddElementsListView extends StatefulWidget {
  const ChatsOddElementsListView({
    super.key,
    required this.chatDataList,
    required this.path,
  });

  final List<ChatDataListModel> chatDataList;
  final String path;

  @override
  ChatsOddElementsListViewState createState() =>
      ChatsOddElementsListViewState();
}

class ChatsOddElementsListViewState extends State<ChatsOddElementsListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> oddList = [];
    for (int index = 0; index < widget.chatDataList.length; index++) {
      if (index.isOdd) {
        oddList.add(
          ChatListItem(
            element: widget.chatDataList[index],
            path: widget.path,
          ),
        );
      }
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: oddList.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: oddList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 8,
      ),
    );
  }
}
