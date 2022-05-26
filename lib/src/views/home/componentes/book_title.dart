import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BookTitle extends StatelessWidget {
  const BookTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Text(title,
      style: TextStyle(
        color: AppColors.accentColor.withOpacity(1),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis);
}
