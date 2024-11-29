import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data_list.dart';
import '../../domain/models/poster.dart';
import 'chat_screen_state.dart';

class DetailsScreenState extends Equatable {
  final ContentState loading;
  final ChatDataList currentChat;
  final ContentState error;

  const DetailsScreenState({
    required this.loading,
    required this.currentChat,
    required this.error,
  });

  factory DetailsScreenState.initial() {
    return DetailsScreenState(
      loading: ContentState.loading,
      currentChat: ChatDataList(
        linkUrl: Poster(),
      ),
      error: ContentState.error,
    );
  }

  DetailsScreenState copyWith({
    ContentState? loading,
    ChatDataList? currentChat,
    ContentState? error,
  }) {
    return DetailsScreenState(
      loading: loading ?? this.loading,
      currentChat: currentChat ?? this.currentChat,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        currentChat,
        error,
      ];
}
