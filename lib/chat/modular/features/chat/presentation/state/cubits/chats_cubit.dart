import 'package:bloc/bloc.dart';
import '../../../domain/repository/chat_repository.dart';
import '../../../domain/models/chat_data.dart';
import '../chat_screen_state.dart';

class ChatsCubit extends Cubit<ChatScreenState> {
  ChatsCubit({required this.repository}) : super(ChatScreenState.initial()) {
    _getData();
  }

  final ChatRepository repository;

  selectChat(ChatData result) {
    emit(state.copyWith(chatData: state.chatData));
  }

  _getData() {
    emit(state.copyWith(chatData: repository.getData()));
  }
}
