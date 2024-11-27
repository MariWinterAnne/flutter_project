import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data.dart';

enum ContentState {
  loading,
  success,
  error,
}

class ChatScreenState extends Equatable {
  final ContentState loading;
  final ChatData chatData;
  final ContentState error;

  const ChatScreenState({
    required this.loading,
    required this.chatData,
    required this.error,
  });

  factory ChatScreenState.initial() {
    return ChatScreenState(
      loading: ContentState.loading,
      chatData: ChatData(),
      error: ContentState.error,
    );
  }

  ChatScreenState copyWith({
    ChatData? chatData,
    ContentState? loading,
    ContentState? error,
  }) {
    return ChatScreenState(
      loading: loading ?? this.loading,
      chatData: chatData ?? this.chatData,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        chatData,
        error,
      ];
}
