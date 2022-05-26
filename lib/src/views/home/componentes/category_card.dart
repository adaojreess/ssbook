import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:desafio_studio_sol/src/views/home/home_page_store.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.store,
    required this.context,
    required this.text,
    required this.currentCategory,
  }) : super(key: key);

  final HomePageStore store;
  final BuildContext context;
  final String text;
  final bool currentCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.setCurrentCategory(text);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: AppColors.accentColor.withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(30),
          color: currentCategory ? AppColors.primaryColor : Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05,
          vertical: MediaQuery.of(context).size.height * .015,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: currentCategory
                ? Colors.white
                : AppColors.accentColor.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
