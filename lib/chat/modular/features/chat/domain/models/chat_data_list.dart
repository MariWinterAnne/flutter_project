import 'images.dart';
import 'poster.dart';
import 'genre.dart';

class ChatDataList {
  const ChatDataList({
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
