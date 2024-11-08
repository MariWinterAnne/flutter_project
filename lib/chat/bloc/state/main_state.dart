import 'package:equatable/equatable.dart';

import '../../domain/models/chat_data_model.dart';

enum ChatScreenContentState { idle, loading, success, error }

class ChatScreenState extends Equatable {
  final ChatScreenContentState loading;
  final ChatDataModel result;

  const ChatScreenState({
    required this.loading,
    required this.result,
  });

  factory ChatScreenState.initial() {
    return ChatScreenState(
        loading: ChatScreenContentState.idle, result: ChatDataModel());
  }

  copyWith({
    ChatScreenContentState? loading,
    ChatDataModel? result,
  }) {
    return ChatScreenState(
      loading: loading ?? this.loading,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        result,
      ];
}
