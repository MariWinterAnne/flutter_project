import '../../domain/repository/chat_repository.dart';
import '../../domain/models/chat_data.dart';
import '../mappers/chat_data_mapper.dart';
import '../models/chat_data_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  ChatData getData() {
    return ChatDataModel().toDomainModel();
  }
}
