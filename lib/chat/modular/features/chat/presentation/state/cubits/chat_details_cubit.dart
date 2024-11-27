import 'package:bloc/bloc.dart';
import '../../../domain/repository/chat_repository.dart';
import '../chat_screen_state.dart';
import '../details_screen_state.dart';

class ChatDetailsCubit extends Cubit<DetailsScreenState> {
  final ChatRepository repository;

  ChatDetailsCubit({required this.repository, required int chatId})
      : super(
          DetailsScreenState.initial(),
        ) {
    _getData(chatId);
  }

  _getData(int chatId) async {
    final result = await repository.getData();
    emit(
      state.copyWith(
        loading: ContentState.success,
        currentChat:
            result.chatDataList.firstWhere((chat) => chat.id == chatId),
        error: ContentState.error,
      ),
    );
  }
}
