import '../../domain/models/chat_data_model.dart';

abstract class ChatRepositoryInterface {
  Future<ChatDataModel> getData();
}

class ChatRepository implements ChatRepositoryInterface {

  @override
  Future<ChatDataModel> getData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return ChatDataModel();
  }
}