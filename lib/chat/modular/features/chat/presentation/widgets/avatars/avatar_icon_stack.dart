import 'package:flutter/material.dart';
import '../../../domain/models/chat_data_list_model.dart';
import 'avatar_icon.dart';

class AvatarIconStack extends StatefulWidget {
  final List<ChatDataListModel> chatDataList;

  const AvatarIconStack({
    super.key,
    required this.chatDataList,
  });

  @override
  State<StatefulWidget> createState() => _AvatarIconStackState();
}

class _AvatarIconStackState extends State<AvatarIconStack> {
  @override
  Widget build(BuildContext context) {
    const offset = 10.0;

    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            textDirection: TextDirection.rtl,
            children: List<Widget>.generate(
              widget.chatDataList.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(right: index.toDouble() * offset),
                  child: AvatarIcon(iconLink: widget.chatDataList[index].linkUrl),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Chats',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
