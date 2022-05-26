import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/repositories/profile_repository_impl.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBar({
    Key? key,
    this.bottom,
    required this.context,
  }) : super(key: key);

  PreferredSizeWidget? bottom;

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
        ),
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
          _profilePictureWidget(context)
        ],
      ),
      bottom: bottom,
    );
  }

  FutureBuilder<String> _profilePictureWidget(BuildContext context) {
    return FutureBuilder<String>(
      future: ProfileRepositoryImpl().getUserPicture(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return _imageNetworkErrorWidget();
        }
        if (snapshot.hasData) {
          return CachedNetworkImage(
            imageUrl: snapshot.data ?? '',
            imageBuilder: (_, image) => CircleAvatar(
              backgroundImage: image,
              minRadius: MediaQuery.of(context).size.height * .03,
            ),
            placeholder: (_, __) => _loadingImageNetworkWidget(),
            errorWidget: (_, __, ___) => _imageNetworkErrorWidget(),
          );
        }
        return _loadingImageNetworkWidget();
      },
    );
  }

  CircleAvatar _imageNetworkErrorWidget() =>
      CircleAvatar(backgroundColor: AppColors.primaryColor);

  CircleAvatar _loadingImageNetworkWidget() {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * .15);
}
