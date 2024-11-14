import '../models/chat_data_model.dart';

abstract class ChatRepository {
  ChatDataModel getData();
}