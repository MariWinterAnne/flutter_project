import 'images.dart';
import 'poster.dart';
import 'genre.dart';

class ChatDataList {
  const ChatDataList({
    this.id = 0,
    required this.linkUrl,
    this.title = '',
    this.subtitle = '',
    this.time = 0,
    this.unreadMessages,
    this.text = '',
    this.cardImageLink,
    this.type,
    this.stars,
    this.awards,
    this.rating,
    this.language,
  });

  final int id;
  final Poster linkUrl;
  final String title;
  final String subtitle;
  final int time;
  final int? unreadMessages;
  final String text;
  final List<Images>? cardImageLink;
  final List<Genre>? type;
  final String? stars;
  final String? awards;
  final double? rating;
  final String? language;
}
