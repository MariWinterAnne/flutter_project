import 'package:flutter/material.dart';
import '../../../domain/models/chat_data_list.dart';
import '../list_item.dart';

class ChatsListView extends StatefulWidget {
  const ChatsListView(
      {super.key, required this.chatDataList, required this.path});

  final List<ChatDataList> chatDataList;
  final String path;

  @override
  ChatsListViewState createState() => ChatsListViewState();
}

class ChatsListViewState extends State<ChatsListView> {
  final _listItems = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() {
    var future = Future(() {});
    for (var element in widget.chatDataList) {
      future = future.then(
        (_) {
          return Future.delayed(
            const Duration(milliseconds: 100),
            () {
              _listItems.add(element);
              _key.currentState?.insertItem(_listItems.length - 1);
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      padding: const EdgeInsets.all(8),
      initialItemCount: _listItems.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return SlideTransition(
          position: CurvedAnimation(
            curve: Curves.easeOut,
            parent: animation,
          ).drive(
            (Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            )),
          ),
          child: ChatListItem(
            element: _listItems[index],
            path: widget.path,
          ),
        );
      },
    );
  }
}
