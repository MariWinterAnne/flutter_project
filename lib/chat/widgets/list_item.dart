import 'package:flutter/material.dart';
import 'text.dart';

class ChatListItem extends StatefulWidget {
  final String linkUrl;
  final String title;
  final String subtitle;
  final String time;
  final String? messages;

  const ChatListItem({
    super.key,
    required this.linkUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.messages,
  });

  @override
  State<StatefulWidget> createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: CircleAvatar(
          backgroundImage: AssetImage(widget.linkUrl),
        ),
      ),
      title: TitleText(title: widget.title),
      subtitle: SubtitleText(subtitleText: widget.subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TimeText(time: widget.time),
          if (widget.messages != null)
            CircleAvatar(
              backgroundColor: Colors.white54.withAlpha(70),
              radius: 10,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(widget.messages as String),
              ),
            ),
        ],
      ),
    );
  }
}
