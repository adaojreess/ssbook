import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/repositories/book_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePageStore {
  HomePageStore() {
    getFavoriteBookList();
  }

  final ValueNotifier<bool> loadingBookList = ValueNotifier(false);
  final ValueNotifier<List<BookModel>> bookList = ValueNotifier([]);
  final ValueNotifier<String> errorMessage = ValueNotifier("");

  Future<void> getFavoriteBookList() async {
    try {
      loadingBookList.value = true;
      final _list = await BookRepositoryImpl().getBookList();
      await Future.delayed(const Duration(seconds: 5));
      bookList.value = _list;
    } catch (e) {
      errorMessage.value = "Falha ao carregar dados";
    } finally {
      loadingBookList.value = false;
    }
  }
}
