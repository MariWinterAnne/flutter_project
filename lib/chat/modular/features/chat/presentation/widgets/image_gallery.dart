import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../utils/string_extensions.dart';
import '../../domain/models/images.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key, required this.imagesList});

  final List<Images> imagesList;

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 300,
        height: 200,
        child: RotatedBox(
          quarterTurns: -45,
          child: ListWheelScrollView(
            itemExtent: 200,
            overAndUnderCenterOpacity: 0.7,
            squeeze: 1.0,
            children: widget.imagesList
                .map(
                  (photo) => RotatedBox(
                    quarterTurns: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: photo.image ?? empty(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
