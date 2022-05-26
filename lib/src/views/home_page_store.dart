import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/repositories/book_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePageStore {
  HomePageStore() {
    getFavoriteBookList();
    getBookList();
  }

  final ValueNotifier<bool> loadingFavoriteBookList = ValueNotifier(false);
  final ValueNotifier<List<BookModel>> favoriteBookList = ValueNotifier([]);
  final ValueNotifier<String> errorMessageFavoriteBookList = ValueNotifier("");

  final ValueNotifier<bool> loadingAllBooks = ValueNotifier(false);
  final ValueNotifier<List<BookModel>> allBooks = ValueNotifier([]);
  final ValueNotifier<String> errorMessageAllBooks = ValueNotifier("");

  Future<void> getFavoriteBookList() async {
    try {
      loadingFavoriteBookList.value = true;
      final list = await BookRepositoryImpl().getFavoriteBookList();
      allBooks.value = list;
    } catch (e) {
      errorMessageFavoriteBookList.value = "Falha ao carregar dados";
    } finally {
      loadingFavoriteBookList.value = false;
    }
  }

  Future<void> getBookList() async {
    try {
      loadingAllBooks.value = true;
      final list = await BookRepositoryImpl().getBookList();
      allBooks.value = list;
    } catch (e) {
      errorMessageAllBooks.value = "Falha ao carregar dados";
    } finally {
      loadingAllBooks.value = false;
    }
  }
}
