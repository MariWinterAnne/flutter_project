import '../models/chat_data.dart';

abstract class ChatRepository {
  Future<ChatData> getData();
}
