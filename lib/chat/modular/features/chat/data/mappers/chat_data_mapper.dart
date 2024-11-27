import '../../domain/models/chat_data.dart';
import '../../domain/models/chat_data_list.dart';
import '../../domain/models/images.dart';
import '../../domain/models/poster.dart';
import '../../domain/models/genre.dart';
import '../models/chat_data_list_model.dart';
import '../models/chat_data_model.dart';
import '../models/images_model.dart';
import '../models/poster_model.dart';
import '../models/genre_model.dart';

extension GenreMapper on GenreModel {
  Genre toDomainModel() => Genre(name: name);
}

extension GenreListMapper on List<GenreModel> {
  List<Genre> toDomainModel() {
    var list = <Genre>[];

    for (var model in this) {
      var element = model.toDomainModel();
      list.add(element);
    }
    return list;
  }
}

extension ImagesMapper on ImagesModel {
  Images toDomainModel() => Images(image: image);
}

extension ImagesListMapper on List<ImagesModel> {
  List<Images> toDomainModel() {
    var list = <Images>[];

    for (var model in this) {
      var element = model.toDomainModel();
      list.add(element);
    }
    return list;
  }
}

extension PosterMapper on PosterModel {
  Poster toDomainModel() => Poster(image: image);
}

extension ChatDataListElementMapper on ChatDataListModel {
  ChatDataList toDomainModel() => ChatDataList(
        id: id,
        linkUrl: linkUrl.toDomainModel(),
        title: title,
        subtitle: subtitle,
        time: time,
        unreadMessages: unreadMessages,
        text: text,
        cardImageLink: cardImageLink?.toDomainModel(),
        type: type?.toDomainModel(),
        stars: stars,
        awards: awards,
        rating: rating,
        language: language,
      );
}

extension ChatDataListMapper on List<ChatDataListModel> {
  List<ChatDataList> toDomainModel() {
    var list = <ChatDataList>[];

    for (var model in this) {
      var element = model.toDomainModel();
      list.add(element);
    }
    return list;
  }
}

extension ChatDataMapper on ChatDataModel {
  ChatData toDomainModel() => ChatData(
        titles: titles,
        chatDataList: chatDataList.toDomainModel(),
      );
}
