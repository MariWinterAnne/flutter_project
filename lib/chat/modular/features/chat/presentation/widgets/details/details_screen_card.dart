import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/string_extensions.dart';
import '../../../domain/models/chat_data_list.dart';
import '../animated_avatar.dart';

class CardView extends StatefulWidget {
  final ChatDataList element;

  const CardView({
    super.key,
    required this.element,
  });

  @override
  State<StatefulWidget> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedAvatar(imageUrl: widget.element.linkUrl),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(widget.element.title),
                    ),
                    if (widget.element.cardImageLink != null &&
                        widget.element.cardImageLink?.isNotEmpty == true)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: widget.element.cardImageLink ?? empty(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        widget.element.subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        widget.element.text,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
