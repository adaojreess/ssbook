import 'package:desafio_studio_sol/src/models/author_model.dart';
import 'package:desafio_studio_sol/src/models/book_model.dart';

abstract class AuthorRepository {
  Future<List<AuthorModel>> getFavoriteAuthor();
}
