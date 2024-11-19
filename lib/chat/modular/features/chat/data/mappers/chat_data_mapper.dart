import '../../domain/models/chat_data.dart';
import '../../domain/models/chat_data_list.dart';
import '../models/chat_data_list_model.dart';
import '../models/chat_data_model.dart';

extension ChatDataListElementMapper on ChatDataListModel {
  ChatDataList toDomainModel() => ChatDataList(
        id: id,
        linkUrl: linkUrl,
        title: title,
        subtitle: subtitle,
        time: time,
        unreadMessages: unreadMessages,
        text: text,
        cardImageLink: cardImageLink,
        type: type,
      );
}

extension ChatDataListMapper on List<ChatDataListModel> {
  List<ChatDataList> toDomainModel() {
    var list = <ChatDataList>[];

    for (var model in this) {
      var element = model.toDomainModel();
      list.add(element);
    }
    return list;
  }
}

extension ChatDataMapper on ChatDataModel {
  ChatData toDomainModel() => ChatData(
        titles: titles,
        chatDataList: chatDataList.toDomainModel(),
      );
}
