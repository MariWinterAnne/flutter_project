import 'package:bloc/bloc.dart';
import '../../../domain/repository/chat_repository.dart';
import '../details_screen_state.dart';

class ChatDetailsCubit extends Cubit<DetailsScreenState> {
  final ChatRepository repository;

  ChatDetailsCubit({required this.repository, required int chatId})
      : super(
          DetailsScreenState.initial(repository
              .getData()
              .chatDataList
              .firstWhere((chat) => chat.id == chatId)),
        );
}
