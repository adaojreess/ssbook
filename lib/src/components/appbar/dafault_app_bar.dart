import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBar({Key? key, this.bottom}) : super(key: key);

  PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(32)),
      ),
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text.rich(
            TextSpan(
              text: 'SS',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                color: AppColors.accentColor.withOpacity(1),
              ),
              children: [
                TextSpan(
                  text: 'BOOK',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const CircleAvatar(),
        ],
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
