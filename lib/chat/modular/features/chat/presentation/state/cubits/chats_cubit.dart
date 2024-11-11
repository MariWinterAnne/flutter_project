import 'package:bloc/bloc.dart';
import '../../../domain/repository/chat_repository.dart';
import '../../../domain/models/chat_data_model.dart';
import '../chat_screen_state.dart';

class ChatsCubit extends Cubit<ChatScreenState> {
  ChatsCubit({required this.repository}) : super(ChatScreenState.initial());

  final ChatRepository repository;

  selectChat(ChatDataModel result) {
    emit(state.copyWith(chatData: state.chatData));
  }
}
