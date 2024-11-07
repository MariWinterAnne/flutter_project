import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../text.dart';

class CardView extends StatefulWidget {
  final String title;
  final String subtitle;
  final String link;
  final String text;
  final String? cardImageLink;

  const CardView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.link,
    required this.text,
    required this.cardImageLink,
  });

  @override
  State<StatefulWidget> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: AppColors.darkThemeColor,
      margin: const EdgeInsets.only(left: 8, top: 16),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.link),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: TitleText(title: widget.title),
                    ),
                    //TODO загрузку и кеширование перенести в domain-слой
                    if (widget.cardImageLink != null && widget.cardImageLink?.isNotEmpty == true)
                      CachedNetworkImage(
                        imageUrl: widget.cardImageLink ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: SubtitleText(
                          subtitleText: widget.subtitle,
                          subtitleTextColor: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(widget.text,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
