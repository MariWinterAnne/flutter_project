import 'package:bloc/bloc.dart';
import '../repository/chat_repository.dart';
import 'main_state.dart';

class ChatCubit extends Cubit<ChatScreenState> {
  final ChatRepositoryInterface chatRepository;

  ChatCubit({required this.chatRepository}) : super(ChatScreenState.initial());

  sendRequest() async {
    emit(
      state.copyWith(
        loading: ChatScreenContentState.loading,
      ),
    );

    final result = await chatRepository.getData();

    emit(
      state.copyWith(
        loading: ChatScreenContentState.success,
        result: result,
      ),
    );
  }
}
