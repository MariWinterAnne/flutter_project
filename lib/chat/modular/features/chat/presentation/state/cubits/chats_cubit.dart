import 'package:bloc/bloc.dart';
import '../../../domain/models/chat_data.dart';
import '../../../domain/usecase/get_data_usecase.dart';
import '../chat_screen_state.dart';

class ChatsCubit extends Cubit<ChatScreenState> {
  ChatsCubit({required this.getDataUseCase})
      : super(ChatScreenState.initial()) {
    _getData();
  }

  final GetDataUseCase getDataUseCase;

  selectChat(ChatData result) {
    emit(state.copyWith(chatData: state.chatData));
  }

  getFilteredData(String? word) async {
    emit(state.copyWith(loading: ContentState.loading));
    final result = await getDataUseCase.getData(word);
    emit(
      state.copyWith(
        loading: ContentState.success,
        chatData: result,
        error: ContentState.error,
      ),
    );
  }

  _getData() async {
    final result = await getDataUseCase.getData('');
    emit(
      state.copyWith(
        loading: ContentState.success,
        chatData: result,
        error: ContentState.error,
      ),
    );
  }
}
