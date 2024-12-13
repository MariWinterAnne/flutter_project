import '../../../../utils/string_extensions.dart';

class ImagesModel {
  String? image;

  ImagesModel({required this.image});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(image: json['image'] ?? empty());
  }
}
