import '../../../../utils/string_extensions.dart';

class GenreModel {
  String? name;

  GenreModel({required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(name: json['slug'] ?? empty());
  }
}
