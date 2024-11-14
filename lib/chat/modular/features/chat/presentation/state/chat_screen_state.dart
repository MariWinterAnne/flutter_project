import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data_model.dart';

class ChatScreenState extends Equatable {
  final ChatDataModel chatData;

  const ChatScreenState({required this.chatData});

  factory ChatScreenState.initial() {
    return ChatScreenState(chatData: ChatDataModel());
  }

  ChatScreenState copyWith({ChatDataModel? chatData}) {
    return ChatScreenState(chatData: chatData ?? this.chatData);
  }

  @override
  List<Object?> get props => [
        chatData,
      ];
}
