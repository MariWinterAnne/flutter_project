import '../../data/repository/chat_repository_impl.dart';
import '../models/chat_data.dart';

class GetDataUseCase {
  final ChatRepositoryImpl repository = ChatRepositoryImpl();

  Future<ChatData> getData(String? word) async {
    if (word != null && word != '') {
      var l = await repository.getData();
      return l.copyWith(
          chatDataList: l.chatDataList
              .where((element) => element.title.contains(word))
              .toList());
    } else {
      return repository.getData();
    }
  }
}
