import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      alignment: Alignment.center,
      child: Tab(
        child: Text(
          title,
          style: TextStyle(color: AppColors.accentColor.withOpacity(1.0)),
        ),
      ),
    );
  }
}
