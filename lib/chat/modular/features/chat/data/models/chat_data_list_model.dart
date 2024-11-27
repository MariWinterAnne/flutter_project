import '../../../../utils/string_extensions.dart';
import 'images_model.dart';
import 'poster_model.dart';
import 'genre_model.dart';

class ChatDataListModel {
  const ChatDataListModel({
    required this.id,
    required this.linkUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.unreadMessages,
    required this.text,
    required this.cardImageLink,
    required this.type,
    required this.stars,
    required this.awards,
    required this.rating,
    required this.language,
  });

  final int id;
  final PosterModel linkUrl;
  final String title;
  final String subtitle;
  final int time;
  final int? unreadMessages;
  final String text;
  final List<ImagesModel>? cardImageLink;
  final List<GenreModel>? type;
  final String? stars;
  final String? awards;
  final double? rating;
  final String? language;

  factory ChatDataListModel.fromJson(Map<String, dynamic> json) {
    var imageData = <ImagesModel>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        imageData.add(ImagesModel.fromJson(v));
      });
    }

    var genresData = <GenreModel>[];
    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genresData.add(GenreModel.fromJson(v));
      });
    }

    return ChatDataListModel(
      id: json['id'],
      linkUrl: PosterModel.fromJson(json['poster']),
      title: json['title'],
      subtitle: json['description'] ?? empty(),
      time: json['publication_date'] ?? empty(),
      unreadMessages: json['favorites_count'] ?? empty(),
      text: json['body_text'] ?? empty(),
      cardImageLink: imageData,
      type: genresData,
      stars: json['stars'],
      awards: json['awards'],
      rating: json['imdb_rating'],
      language: json['language'],
    );
  }
}
