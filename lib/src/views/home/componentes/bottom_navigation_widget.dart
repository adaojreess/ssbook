import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: key,
      currentIndex: 0,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.accentColor.withOpacity(1),
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_rounded,
          ),
          label: 'Adicionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
