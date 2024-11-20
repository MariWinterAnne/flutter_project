import 'chat_data_list.dart';

class ChatData {
  ChatData({
    this.titles = const <String>[],
    this.chatDataList = const <ChatDataList>[],
  });

  final List<String> titles;
  final List<ChatDataList> chatDataList;

  ChatData copyWith({
    final List<String>? titles,
    final List<ChatDataList>? chatDataList,
  }) {
    return ChatData(
      titles: titles ?? this.titles,
      chatDataList: chatDataList ?? this.chatDataList,
    );
  }
}
