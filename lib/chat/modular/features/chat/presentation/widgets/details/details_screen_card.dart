import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/chat_data_list_model.dart';

class CardView extends StatefulWidget {
  final ChatDataListModel element;

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
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.element.linkUrl),
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
                      child: Text(widget.element.title),
                    ),
                    //TODO загрузку и кеширование перенести в domain-слой
                    if (widget.element.cardImageLink != null &&
                        widget.element.cardImageLink?.isNotEmpty == true)
                      CachedNetworkImage(
                        imageUrl: widget.element.cardImageLink ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
