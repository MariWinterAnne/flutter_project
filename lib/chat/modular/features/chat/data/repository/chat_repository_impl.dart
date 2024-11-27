import '../../../../../network/request.dart';
import '../../domain/repository/chat_repository.dart';
import '../../domain/models/chat_data.dart';
import '../mappers/chat_data_mapper.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<ChatData> getData() async {
    final response = await httpRequest();
    return response.toDomainModel();
  }
}
