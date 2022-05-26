import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: TextStyle(
          color: AppColors.accentColor.withOpacity(1),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
}
