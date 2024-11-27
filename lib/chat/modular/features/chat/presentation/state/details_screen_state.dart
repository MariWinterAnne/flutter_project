import 'package:equatable/equatable.dart';
import '../../domain/models/chat_data_list.dart';
import '../../domain/models/poster.dart';

class DetailsScreenState extends Equatable {
  final ChatDataList currentChat;

  const DetailsScreenState({required this.currentChat});

  factory DetailsScreenState.initial() {
    return DetailsScreenState(
        currentChat: ChatDataList(
            id: 0,
            linkUrl: Poster(image: ''),
            title: '',
            subtitle: '',
            time: 0,
            unreadMessages: 0,
            text: '',
            cardImageLink: [],
            type: [],
            stars: '',
            awards: '',
            rating: 0,
            language: ''));
  }

  DetailsScreenState copyWith({ChatDataList? currentChat}) {
    return DetailsScreenState(currentChat: currentChat ?? this.currentChat);
  }

  @override
  List<Object?> get props => [];
}
