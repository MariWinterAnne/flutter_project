import '../../../../../network/request.dart';
import '../../domain/repository/chat_repository.dart';
import '../../domain/models/chat_data.dart';
import '../mappers/chat_data_mapper.dart';

class ChatRepositoryImpl implements ChatRepository {
  final RequestProvider _requestProvider = RequestProvider();

  @override
  Future<ChatData> getData() async {
    final response = await _requestProvider.httpRequest();
    return response.toDomainModel();
  }
}
