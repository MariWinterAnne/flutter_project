import 'package:flutter/material.dart';
import '../../../domain/models/chat_data_list_model.dart';
import '../list_item.dart';

//TODO: все фильтры на domain-слое
class ChatsEvenElementsListView extends StatefulWidget {
  const ChatsEvenElementsListView({
    super.key,
    required this.chatDataList,
    required this.path,
  });

  final List<ChatDataListModel> chatDataList;
  final String path;

  @override
  ChatsEvenElementsListViewState createState() =>
      ChatsEvenElementsListViewState();
}

class ChatsEvenElementsListViewState extends State<ChatsEvenElementsListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> evenList = [];
    for (int index = 0; index < widget.chatDataList.length; index++) {
      if (index.isEven) {
        evenList.add(
          ChatListItem(
            element: widget.chatDataList[index],
            path: widget.path,
          ),
        );
      }
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: evenList.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: evenList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 8,
      ),
    );
  }
}
