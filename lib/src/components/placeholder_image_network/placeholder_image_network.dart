import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PlaceholderImageNetwork extends StatelessWidget {
  const PlaceholderImageNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
