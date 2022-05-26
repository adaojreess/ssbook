import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/repositories/book_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../global_vars.dart';
import '../models/response_model.dart';

class BookRepositoryImpl implements BookRepository {
  @override
  Future<List<BookModel>> getBookList() async {
    String readRepositories = """
      query minhaQuery {
        favoriteBooks {
          name
          id
          cover
          author {
            id
            name
          }
        }
      }
""";
    final result = await api.value.get(readRepositories);
    final bookList = ((result as ResponseModel<QueryResult>)
            .response
            ?.data!['favoriteBooks'] as List)
        .map((json) => BookModel.fromJson(json))
        .toList();
    return bookList;
  }

  @override
  Future<List<BookModel>> getFavoriteBookList() {
    throw UnimplementedError();
  }
}
