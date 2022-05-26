import 'package:desafio_studio_sol/src/models/author_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../global_vars.dart';
import '../models/response_model.dart';
import 'author_repository.dart';

class AuthorRepositoryImpl extends AuthorRepository {
  @override
  Future<List<AuthorModel>> getFavoriteAuthor() async {
    String readRepositories = """
      query favoriteAuthorsQuery {
        favoriteAuthors {
          name
          picture
          booksCount
        }
      }
""";
    final result = await api.value.get(readRepositories);
    final favoriteAuthors = ((result as ResponseModel<QueryResult>)
            .response
            ?.data!['favoriteAuthors'] as List)
        .map((json) => AuthorModel.fromJson(json))
        .toList();
    return favoriteAuthors;
  }
}
