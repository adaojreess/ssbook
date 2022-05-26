import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthorName extends StatelessWidget {
  const AuthorName(
    this.authorName, {
    Key? key,
  }) : super(key: key);

  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Text(
      authorName,
      style: TextStyle(
        color: AppColors.accentColor.withOpacity(1),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
