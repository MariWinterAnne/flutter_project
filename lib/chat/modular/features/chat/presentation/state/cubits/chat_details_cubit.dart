import 'package:bloc/bloc.dart';
import '../../../domain/usecase/get_data_usecase.dart';
import '../chat_screen_state.dart';
import '../details_screen_state.dart';

class ChatDetailsCubit extends Cubit<DetailsScreenState> {
  final GetDataUseCase getDataUseCase;

  ChatDetailsCubit({required this.getDataUseCase, required int chatId})
      : super(
          DetailsScreenState.initial(),
        ) {
    _getData(chatId);
  }

  _getData(int chatId) async {
    final result = await getDataUseCase.getData('');
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
