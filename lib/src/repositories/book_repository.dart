import 'package:desafio_studio_sol/src/models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getBookList();

  Future<List<BookModel>> getFavoriteBookList();


  Future<BookModel> getBook(String id);
}
