import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data.dart';

class ChatScreenState extends Equatable {
  final ChatData chatData;

  const ChatScreenState({required this.chatData});

  factory ChatScreenState.initial() {
    return ChatScreenState(chatData: ChatData());
  }

  ChatScreenState copyWith({ChatData? chatData}) {
    return ChatScreenState(chatData: chatData ?? this.chatData);
  }

  @override
  List<Object?> get props => [
        chatData,
      ];
}
