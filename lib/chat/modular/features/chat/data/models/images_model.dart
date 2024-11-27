class ImagesModel {
  String? image;

  ImagesModel({this.image});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(image: json['image'] ?? '');
  }
}
