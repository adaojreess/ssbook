import 'package:desafio_studio_sol/src/models/author_model.dart';
import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/repositories/author_repository_impl.dart';
import 'package:desafio_studio_sol/src/repositories/book_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePageStore {
  HomePageStore() {
    getFavoriteBookList();
    getFavoriteAuthors();
    getBookList();
  }
  final ValueNotifier<String> currentCategory = ValueNotifier("Todos");
  void setCurrentCategory(String value) => currentCategory.value = value;

  final ValueNotifier<bool> loadingFavoriteBookList = ValueNotifier(false);
  final ValueNotifier<List<BookModel>> favoriteBookList = ValueNotifier([]);
  final ValueNotifier<String> errorMessageFavoriteBookList = ValueNotifier("");

  final ValueNotifier<bool> loadingAllBooks = ValueNotifier(false);
  final ValueNotifier<List<BookModel>> allBooks = ValueNotifier([]);
  final ValueNotifier<String> errorMessageAllBooks = ValueNotifier("");

  final ValueNotifier<bool> loadingFavoriteAuthors = ValueNotifier(false);
  final ValueNotifier<List<AuthorModel>> favoriteAuthors = ValueNotifier([]);
  final ValueNotifier<String> errorMessageFavoriteAuthors = ValueNotifier("");

  Future<void> getFavoriteBookList() async {
    try {
      loadingFavoriteBookList.value = true;
      final list = await BookRepositoryImpl().getFavoriteBookList();
      favoriteBookList.value = list;
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

  Future<void> getFavoriteAuthors() async {
    try {
      loadingFavoriteAuthors.value = true;
      final list = await AuthorRepositoryImpl().getFavoriteAuthor();
      favoriteAuthors.value = list;
    } catch (e) {
      errorMessageFavoriteAuthors.value = "Falha ao carregar dados";
    } finally {
      loadingFavoriteAuthors.value = false;
    }
  }
}
