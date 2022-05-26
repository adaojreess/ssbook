import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/repositories/book_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../global_vars.dart';
import '../models/response_model.dart';

class BookRepositoryImpl implements BookRepository {
  @override
  Future<List<BookModel>> getBookList() async {
    String readRepositories = """
      query allBooksQuery {
        allBooks {
          name
          id
          cover
          author {
            name
          }
        }
      }
""";
    final result = await api.value.get(readRepositories);
    final bookList = ((result as ResponseModel<QueryResult>)
            .response
            ?.data!['allBooks'] as List)
        .map((json) => BookModel.fromJson(json))
        .toList();
    return bookList;
  }

  @override
  Future<List<BookModel>> getFavoriteBookList() async {
    String readRepositories = """
      query favoriteBooksQuery {
        favoriteBooks {
          name
          id
          cover
          author {
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
  Future<BookModel> getBook(String id) async {
    String readRepositories = """
      query bookQuery {
        book(id:"$id") {
          id
          name
          cover
          description
          isFavorite
          author {
            name
          }
        }
      }
""";
    final result = await api.value.get(readRepositories);
    final book = BookModel.fromJson(
        (result as ResponseModel<QueryResult>).response?.data!['book']);
    return book;
  }
}
