import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/components/error_image_network/error_image_network.dart';
import 'package:desafio_studio_sol/src/components/placeholder_image_network/placeholder_image_network.dart';
import 'package:desafio_studio_sol/src/models/author_model.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:desafio_studio_sol/src/views/home/componentes/book_title.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    Key? key,
    required this.context,
    required this.index,
    required this.author,
  }) : super(key: key);

  final BuildContext context;
  final int index;
  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: AppColors.accentColor.withOpacity(1), width: .5),
        ),
        height: MediaQuery.of(context).size.height / 10,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: author.picture ?? "",
              placeholder: (_, __) => const PlaceholderImageNetwork(),
              errorWidget: (_, __, ___) => const ErrorImageNetwork(),
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
                  BookTitle(title: author.name ?? ''),
                  const SizedBox(height: 5),
                  if (author.booksCount == 1)
                    Text('${author.booksCount} livro')
                  else
                    Text('${author.booksCount} livros')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
