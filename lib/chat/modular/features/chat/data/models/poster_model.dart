class PosterModel {
  String? image;

  PosterModel({this.image});

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    return PosterModel(image: json['image'] ?? '');
  }
}