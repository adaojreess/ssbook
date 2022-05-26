import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/components/error_image_network/error_image_network.dart';
import 'package:desafio_studio_sol/src/components/placeholder_image_network/placeholder_image_network.dart';
import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/views/book/book_page.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/author_name.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/book_title.dart';
import 'package:flutter/material.dart';

class BookListCardWidget extends StatelessWidget {
  const BookListCardWidget({
    Key? key,
    required EdgeInsets defaultMarginBody,
    required this.context,
    required this.book,
  }) : _defaultMarginBody = defaultMarginBody, super(key: key);

  final EdgeInsets _defaultMarginBody;
  final BuildContext context;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookPage(book),
          ),
        );
      },
      child: Padding(
        padding: _defaultMarginBody.copyWith(
          bottom: MediaQuery.of(context).size.height / 50,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: book.cover ?? '',
              placeholder: (_, __) => const PlaceholderImageNetwork(),
              errorWidget: (_, __, ___) => const ErrorImageNetwork(),
              imageBuilder: (_, image) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Image(image: image),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookTitle(title: book.name ?? ''),
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    AuthorName(book.author?.name ?? '')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}