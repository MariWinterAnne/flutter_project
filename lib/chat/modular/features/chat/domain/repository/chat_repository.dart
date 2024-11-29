import '../../data/models/chat_data_model.dart';
import '../models/chat_data.dart';

abstract class ChatRepository {
  Future<ChatData> getData();
}
