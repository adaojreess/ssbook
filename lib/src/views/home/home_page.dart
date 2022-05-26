import 'package:desafio_studio_sol/src/components/material_indicator/material_indicator.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/author_card.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/book_card.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/book_list_card.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/bottom_navigation_widget.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/loading_book_list.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/tab_bar_widget.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/title_widget.dart';
import 'package:desafio_studio_sol/src/views/home/home_page_store.dart';
import 'package:flutter/material.dart';

import '../../components/appbar/dafault_app_bar.dart';
import '../../models/author_model.dart';
import '../../models/book_model.dart';
import 'componentes/category_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = HomePageStore();
  final categories = ['Todos', 'Romance', 'Aventura', 'Tecnologia', 'Ficção'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: DefaultAppBar(
            context: context,
            bottom: _bottomAppBarWidget(),
          ),
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                ..._favoriteBooksWidgetList,
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: _allBooksWidget(context),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationWidget(),
        ),
      ),
    );
  }

  Column _allBooksWidget(BuildContext context) {
    return Column(
      children: [
        ..._favoriteAuthorsWidgetList,
        _sessionWidget('Biblioteca', showSeeAll: false),
        SizedBox(height: MediaQuery.of(context).size.height / 40),
        CategoryListWidget(
            defaultMarginBody: _defaultMarginBody,
            categories: categories,
            store: store),
        SizedBox(height: MediaQuery.of(context).size.height / 40),
        ValueListenableBuilder<bool>(
          valueListenable: store.loadingAllBooks,
          builder: (_, loading, __) =>
              loading ? const LoadingBookList() : const SizedBox(),
        ),
        ValueListenableBuilder<List<BookModel>>(
          valueListenable: store.allBooks,
          builder: (_, allBooks, __) {
            return Column(
              children: allBooks
                  .map((book) => BookListCardWidget(
                        defaultMarginBody: _defaultMarginBody,
                        context: context,
                        book: book,
                      ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _sessionWidget(String title, {bool showSeeAll = true}) => Container(
        margin: _defaultMarginBody.copyWith(top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleWidget(title: title),
            if (showSeeAll)
              Text(
                'Ver todos',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      );

  List<Widget> get _favoriteBooksWidgetList => [
        _sessionWidget('Livros favoritos'),
        ValueListenableBuilder<bool>(
          valueListenable: store.loadingFavoriteBookList,
          builder: (_, loading, __) =>
              loading ? const LoadingBookList() : const SizedBox(),
        ),
        ValueListenableBuilder<List<BookModel>>(
          valueListenable: store.favoriteBookList,
          builder: (_, bookList, __) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: bookList
                      .map((book) => Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ).copyWith(
                              left: bookList.indexOf(book) == 0 ? 20 : 10,
                              right: bookList.indexOf(book) == 9 ? 20 : 10,
                            ),
                            child: BookCard(context: context, book: book),
                          ))
                      .toList(),
                ),
              ),
            );
          },
        )
      ];

  List<Widget> get _favoriteAuthorsWidgetList => [
        _sessionWidget('Autores favoritos'),
        ValueListenableBuilder<bool>(
          valueListenable: store.loadingFavoriteAuthors,
          builder: (_, loading, __) =>
              loading ? const LoadingBookList() : const SizedBox(),
        ),
        ValueListenableBuilder<List<AuthorModel>>(
          valueListenable: store.favoriteAuthors,
          builder: (_, favoriteAuthors, __) => Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: favoriteAuthors
                    .map(
                      (author) => AuthorCard(
                          context: context,
                          index: favoriteAuthors.indexOf(author),
                          author: author),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ];

  PreferredSizeWidget _bottomAppBarWidget() {
    return TabBar(
      indicatorWeight: 4,
      indicator: MaterialIndicator(),
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.primaryColor,
      tabs: const <Widget>[
        TabBarWidget(title: 'Meus livros'),
        TabBarWidget(title: 'Emprestados'),
      ],
    );
  }

  EdgeInsets get _defaultMarginBody =>
      const EdgeInsets.symmetric(horizontal: 20);
}