import 'package:desafio_studio_sol/src/models/author_model.dart';

class BookModel {
  BookModel({
    this.id,
    this.name,
    this.author,
    this.cover,
    this.description,
    this.isFavorite,
  });

  String? id;
  String? name;
  AuthorModel? author;
  String? cover;
  String? description;
  bool? isFavorite;

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      name: json['name'],
      cover: json['cover'],
      description: json['description'],
      isFavorite: json['isFavorite'],
      author:
          json['author'] != null ? AuthorModel.fromJson(json['author']) : null,
    );
  }
}
