import 'package:desafio_studio_sol/src/views/home/componentes/category_card.dart';
import 'package:desafio_studio_sol/src/views/home/home_page_store.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required EdgeInsets defaultMarginBody,
    required this.categories,
    required this.store,
  })  : _defaultMarginBody = defaultMarginBody,
        super(key: key);

  final EdgeInsets _defaultMarginBody;
  final List<String> categories;
  final HomePageStore store;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: _defaultMarginBody,
        child: Row(
          children: categories
              .map(
                (category) => Container(
                  margin: EdgeInsets.only(
                    left: category == 'Todos'
                        ? 0
                        : MediaQuery.of(context).size.width * .01,
                    right: categories.indexOf(category) == 9
                        ? 0
                        : MediaQuery.of(context).size.width * .01,
                  ),
                  child: ValueListenableBuilder<String>(
                    valueListenable: store.currentCategory,
                    builder: (_, currentCategory, __) => CategoryCard(
                      store: store,
                      context: context,
                      text: category,
                      currentCategory: category == currentCategory,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
