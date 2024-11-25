import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../theme/colors.dart';
import '../../domain/models/chat_data_list.dart';

class ChatListItem extends StatefulWidget {
  final ChatDataList element;
  final String path;

  const ChatListItem({
    super.key,
    required this.element,
    required this.path,
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
          backgroundImage: AssetImage(widget.element.linkUrl),
        ),
      ),
      title: Text(widget.element.title),
      subtitle: Text(widget.element.subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.element.time,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 8,
                  color: AppColors.greyColor,
                ),
          ),
          if (widget.element.unreadMessages != null)
            CircleAvatar(
              backgroundColor: AppColors.greyColor.withAlpha(70),
              radius: 10,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  widget.element.unreadMessages as String,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 8),
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        Modular.to.pushNamed('/${widget.path}/${widget.element.id}');

        /*SplitView.of(context).popUntil(0);
            SplitView.of(context).push(
              DetailsScreen(
                  chatElement: widget.chatDataList[selectedIndex]),
            );*/
      },
    );
  }
}
