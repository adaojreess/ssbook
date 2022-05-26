class AuthorModel {
  AuthorModel({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
