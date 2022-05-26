import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/global_vars.dart';
import 'package:desafio_studio_sol/src/components/error_image_network/error_image_network.dart';
import 'package:desafio_studio_sol/src/repositories/book_repository_impl.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:desafio_studio_sol/src/views/book/book_page.dart';
import 'package:desafio_studio_sol/src/views/home_page_store.dart';
import 'package:flutter/material.dart';

import '../components/appbar/dafault_app_bar.dart';
import '../components/placeholder_image_network/placeholder_image_network.dart';
import '../models/book_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = HomePageStore();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: DefaultAppBar(
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
                  child: Column(
                    children: [
                      ..._favoriteAuthorsWidgetList,
                      _sessionWidget('Biblioteca', showSeeAll: false),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      _categoryListWidget(context),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      _bookListCardWidget(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.accentColor.withOpacity(1),
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Inicio'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_rounded,
                ),
                label: 'Adicionar',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Busca',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_rounded,
                ),
                label: 'Favoritos',
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _categoryListWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: _defaultMarginBody,
        child: Row(
          children: List.generate(
            10,
            (index) => Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 0 : MediaQuery.of(context).size.width * .01,
                right: index == 9 ? 0 : MediaQuery.of(context).size.width * .01,
              ),
              child: _categoryCardWidget(
                context,
                "Todos",
                currentCategory: index == 0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _categoryCardWidget(BuildContext context, String text,
      {bool currentCategory = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: .5,
          color: AppColors.accentColor.withOpacity(1),
        ),
        borderRadius: BorderRadius.circular(30),
        color: currentCategory ? AppColors.primaryColor : Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .05,
        vertical: MediaQuery.of(context).size.height * .015,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: currentCategory
              ? Colors.white
              : AppColors.accentColor.withOpacity(1),
        ),
      ),
    );
  }

  Padding _bookListCardWidget(BuildContext context) {
    return Padding(
      padding: _defaultMarginBody,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://m.media-amazon.com/images/I/51jmxTnOv6L.jpg',
            placeholder: (_, __) => const PlaceholderImageNetwork(),
            errorWidget: (_, __, ___) => const ErrorImageNetwork(),
            imageBuilder: (_, image) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Image(image: image),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                children: [
                  _bookTitle(
                    'O duque e eu (Os Bridgertons livro novo 1)',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleWidget(String title) => Text(
        title,
        style: TextStyle(
          color: AppColors.accentColor.withOpacity(1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _sessionWidget(String title, {bool showSeeAll = true}) => Container(
        margin: _defaultMarginBody.copyWith(top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _titleWidget(title),
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

  Widget _bookCardWidget(BookModel book) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookPage(),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: book.cover ?? '',
              placeholder: (_, __) => const PlaceholderImageNetwork(),
              imageBuilder: (_, image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(image: image),
                );
              },
              errorWidget: (_, __, ___) => const ErrorImageNetwork(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: _bookTitle(book.name ?? ''),
            ),
            Text(
              book.author?.name ?? '',
              style: TextStyle(
                color: AppColors.accentColor.withOpacity(1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bookTitle(String title) => Text(title,
      style: TextStyle(
        color: AppColors.accentColor.withOpacity(1),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis);

  List<Widget> get _favoriteBooksWidgetList => [
        _sessionWidget('Livros favoritos'),
        ValueListenableBuilder<bool>(
          valueListenable: store.loadingBookList,
          builder: (_, loading, __) =>
              loading ? _loadingBookList() : SizedBox(),
        ),
        ValueListenableBuilder<List<BookModel>>(
          valueListenable: store.bookList,
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
                            child: _bookCardWidget(book),
                          ))
                      .toList(),
                ),
              ),
            );
          },
        )
      ];

  Widget _loadingBookList() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );

  List<Widget> get _favoriteAuthorsWidgetList => [
        _sessionWidget('Autores favoritos'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ).copyWith(
                    left: index == 0 ? 20 : 10,
                    right: index == 9 ? 20 : 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                          color: AppColors.accentColor.withOpacity(1),
                          width: .5),
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://cdn.pensador.com/img/authors/st/ep/stephen-king-l.jpg',
                          placeholder: (_, __) =>
                              const PlaceholderImageNetwork(),
                          errorWidget: (_, __, ___) =>
                              const ErrorImageNetwork(),
                          imageBuilder: (_, image) => ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: Image(image: image),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _bookTitle('Stephen King'),
                              const SizedBox(height: 5),
                              const Text('6 livros')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ];

  Widget _tabBarWidget({required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      alignment: Alignment.centerLeft,
      child: Tab(
        child: Text(
          title,
          style: TextStyle(color: AppColors.accentColor.withOpacity(1.0)),
        ),
      ),
    );
  }

  PreferredSizeWidget _bottomAppBarWidget() {
    return TabBar(
      indicatorWeight: 4,
      indicator: MaterialIndicator(),
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.primaryColor,
      tabs: <Widget>[
        _tabBarWidget(title: 'Meus livros'),
        _tabBarWidget(title: 'Emprestados'),
      ],
    );
  }

  EdgeInsets get _defaultMarginBody =>
      const EdgeInsets.symmetric(horizontal: 20);
}

class MaterialIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final height = 4.0;
  final topRightRadius = 2.0;
  final topLeftRadius = 2.0;
  final bottomRightRadius = 0.0;
  final bottomLeftRadius = 0.0;
  final color = AppColors.primaryColor;
  final horizontalPadding = 0.0;
  final paintingStyle = PaintingStyle.fill;
  final strokeWidth = 2.0;
  final MaterialIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Size mysize =
        Size(configuration.size!.width - (horizontalPadding * 2), height);

    Offset myoffset = Offset(
      offset.dx + (horizontalPadding),
      offset.dy + configuration.size!.height - height,
    );

    final Rect rect = myoffset & mysize;
    final Paint paint = Paint();
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = strokeWidth;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          bottomRight: Radius.circular(bottomRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
        paint);
  }
}
