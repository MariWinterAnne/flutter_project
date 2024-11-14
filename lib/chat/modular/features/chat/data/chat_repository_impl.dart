import '../domain/repository/chat_repository.dart';
import '../domain/models/chat_data_model.dart';

class ChatRepositoryImpl implements ChatRepository {

  @override
  ChatDataModel getData() {
    return ChatDataModel();
  }
}