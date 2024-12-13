import 'chat_data_list_model.dart';

class ChatDataModel {
  ChatDataModel({
    this.titles = const <String>[
      'All chats',
      'Personal',
      'Others',
    ],
    required this.chatDataList,
  });

  final List<String> titles;
  final List<ChatDataListModel> chatDataList;

  factory ChatDataModel.fromJson(Map<String, dynamic> json) {
    var chatData = <ChatDataListModel>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        chatData.add(ChatDataListModel.fromJson(v));
      });
    }
    return ChatDataModel(chatDataList: chatData);
  }
}
