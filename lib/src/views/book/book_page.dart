import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/components/error_image_network/error_image_network.dart';
import 'package:desafio_studio_sol/src/components/placeholder_image_network/placeholder_image_network.dart';
import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:desafio_studio_sol/src/views/book/book_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookPage extends StatelessWidget {
  BookPage(this.book, {Key? key}) : super(key: key);

  final BookModel book;

  late final store = BookStore(book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<BookModel>(
            valueListenable: store.bookDetails,
            builder: (_, bookDetails, __) => CachedNetworkImage(
              imageUrl: bookDetails.cover ?? '',
              errorWidget: (_, __, ___) => const ErrorImageNetwork(),
              placeholder: (_, __) => const PlaceholderImageNetwork(),
              imageBuilder: (_, image) => Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image(
                      image: image,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: _bookDetailsWidget(context),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .05,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionIconWidget(context, icon: Icons.arrow_back,
                      onPressed: () {
                    Navigator.pop(context);
                  }),
                  _actionIconWidget(context, icon: Icons.more_vert),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  IconButton _actionIconWidget(BuildContext context,
      {required IconData icon, VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
    );
  }

  SizedBox _bookDetailsWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
          ),
        ),
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20,
              ).copyWith(
                top: MediaQuery.of(context).size.height / 20,
              ),
              child: Column(
                children: [
                  _bookTitleWidget(context),
                  _bookDescriptionWidget(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _bookDescriptionWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .05,
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: store.loadingBook,
        builder: (_, loading, __) {
          if (loading) {
            return CircularProgressIndicator(color: AppColors.primaryColor);
          }
          return Text(
            store.bookDetails.value.description ?? '',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.accentColor.withOpacity(1),
            ),
          );
        },
      ),
    );
  }

  Container _bookTitleWidget(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder<BookModel>(
                    valueListenable: store.bookDetails,
                    builder: (_, bookDetails, __) => Text(
                      bookDetails.name ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .01,
                bottom: MediaQuery.of(context).size.height * .05,
              ),
              child: ValueListenableBuilder<BookModel>(
                valueListenable: store.bookDetails,
                builder: (_, bookDetails, __) => Text(
                  bookDetails.author?.name ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.accentColor.withOpacity(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
