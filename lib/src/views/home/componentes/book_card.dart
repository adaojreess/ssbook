import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/components/error_image_network/error_image_network.dart';
import 'package:desafio_studio_sol/src/components/placeholder_image_network/placeholder_image_network.dart';
import 'package:desafio_studio_sol/src/models/book_model.dart';
import 'package:desafio_studio_sol/src/views/book/book_page.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/author_name.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/book_title.dart';
import 'package:desafio_studio_sol/src/views/home/home_page.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.context,
    required this.book,
  }) : super(key: key);

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
              child: BookTitle(title: book.name ?? ''),
            ),
            AuthorName(book.author?.name ?? '')
          ],
        ),
      ),
    );
  }
}
