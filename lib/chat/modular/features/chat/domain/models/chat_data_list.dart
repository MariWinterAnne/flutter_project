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
  });

  final int id;
  final String linkUrl;
  final String title;
  final String subtitle;
  final String time;
  final String? unreadMessages;
  final String text;
  final String? cardImageLink;
  final String type;
}
