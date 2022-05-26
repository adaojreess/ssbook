import 'package:desafio_studio_sol/src/repositories/book_repository_impl.dart';
import 'package:flutter/material.dart';

import '../../models/book_model.dart';

class BookStore {
  BookStore(this.book) {
    getBook();
  }
  BookModel book;
  final ValueNotifier<bool> loadingBook = ValueNotifier(false);
  late final ValueNotifier<BookModel> bookDetails = ValueNotifier(book);
  final ValueNotifier<String> errorMessageBook = ValueNotifier("");

  Future<void> getBook() async {
    try {
      loadingBook.value = true;
      final _book = await BookRepositoryImpl().getBook(book.id!);
      bookDetails.value = _book;
    } catch (e) {
      errorMessageBook.value = 'Falha ao carregar os dados';
    } finally {
      loadingBook.value = false;
    }
  }
}
