class AuthorModel {
  AuthorModel({this.id, this.name, this.picture, this.booksCount});

  String? id;
  String? name;
  String? picture;
  int? booksCount;

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      booksCount: json['booksCount'],
    );
  }
}
