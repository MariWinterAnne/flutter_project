class GenreModel {
  String? name;

  GenreModel({this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(name: json['slug'] ?? '');
  }
}
