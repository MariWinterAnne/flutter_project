import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data_list_model.dart';

class DetailsScreenState extends Equatable {
  final ChatDataListModel currentChat;

  const DetailsScreenState({required this.currentChat});

  factory DetailsScreenState.initial(ChatDataListModel currentChat) {
    return DetailsScreenState(currentChat: currentChat);
  }

  @override
  List<Object?> get props => [];
}
