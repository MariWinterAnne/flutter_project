import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data_list.dart';

class DetailsScreenState extends Equatable {
  final ChatDataList currentChat;

  const DetailsScreenState({required this.currentChat});

  factory DetailsScreenState.initial(ChatDataList currentChat) {
    return DetailsScreenState(currentChat: currentChat);
  }

  @override
  List<Object?> get props => [];
}
