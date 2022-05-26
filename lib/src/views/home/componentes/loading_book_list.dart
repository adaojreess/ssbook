import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class LoadingBookList extends StatelessWidget {
  const LoadingBookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
