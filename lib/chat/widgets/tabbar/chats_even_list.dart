import 'package:flutter/material.dart';
import 'package:flutter_split_view/flutter_split_view.dart';
import '../../autoroute/screens/details_screen.dart';
import '../../domain/models/chat_data_list_model.dart';
import '../../theme/colors.dart';
import '../list_item.dart';

//TODO: все фильтры на domain-слое
class ChatsEvenElementsListView extends StatefulWidget {
  const ChatsEvenElementsListView({super.key, required this.chatDataList});

  final List<ChatDataListModel> chatDataList;

  @override
  ChatsEvenElementsListViewState createState() =>
      ChatsEvenElementsListViewState();
}

class ChatsEvenElementsListViewState extends State<ChatsEvenElementsListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<Widget> evenList = [];
    for (int index = 0; index < widget.chatDataList.length; index++) {
      if (index.isEven) {
        evenList.add(
          GestureDetector(
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
            },
          ),
        );
      }
    }

    return ListView.separated(
      itemCount: evenList.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: evenList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 1,
        height: 0,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
