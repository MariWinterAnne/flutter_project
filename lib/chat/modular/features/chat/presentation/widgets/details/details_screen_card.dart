import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import '../../../../../theme/colors.dart';
import '../../../../../utils/string_extensions.dart';
import '../../../domain/models/chat_data_list.dart';
import '../animated_avatar.dart';
import '../image_gallery.dart';

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
        padding: const EdgeInsets.all(16),
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedAvatar(imageUrl: widget.element.linkUrl.image ?? empty()),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(widget.element.title),
                    ),
                    if (widget.element.cardImageLink != null &&
                        widget.element.cardImageLink?.isNotEmpty == true)
                      ImageGallery(
                        imagesList: widget.element.cardImageLink ?? [],
                      ),
                    Row(
                      mainAxisAlignment: widget.element.cardImageLink != null &&
                              widget.element.cardImageLink?.isNotEmpty == true
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.element.subtitle.isNotEmpty)
                          Flexible(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: Text(
                                parse(widget.element.subtitle)
                                        .documentElement
                                        ?.text ??
                                    empty(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        if (widget.element.rating != null &&
                            widget.element.rating != 0)
                          Flexible(
                            flex: 1,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 50,
                                  color: AppColors.elementsColor,
                                ),
                                Text(
                                  widget.element.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        parse(widget.element.text).documentElement?.text ??
                            empty(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        'В ролях: ${widget.element.stars}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    if (widget.element.awards != null &&
                        widget.element.awards?.isNotEmpty == true)
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          widget.element.awards ?? empty(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    if (widget.element.language != null &&
                        widget.element.language?.isNotEmpty == true)
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Язык оригинала: ${widget.element.language}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
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
