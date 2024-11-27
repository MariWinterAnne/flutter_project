import '../../../../utils/string_extensions.dart';

class PosterModel {
  String? image;

  PosterModel({required this.image});

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(image: json['image'] ?? empty());
  }
}