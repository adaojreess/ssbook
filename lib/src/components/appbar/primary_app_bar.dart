import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget with PreferredSizeWidget {
  PrimaryAppBar({Key? key, this.bottom}) : super(key: key);

  PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(32)),
      ),
      backgroundColor: AppColors.primaryColor,
      title: Row(
        children: const [
          Text('SSBOOK'),
          Spacer(),
          CircleAvatar(),
        ],
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
