import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../components/appbar/primary_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PrimaryAppBar(
            bottom: _bottomAppBar(),
          ),
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Livros favoritos',
                          style: TextStyle(
                            color: AppColors.accentColor.withOpacity(1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ver todos',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 10,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: _bookCard(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bookCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: 'https://m.media-amazon.com/images/I/51jmxTnOv6L.jpg',
          placeholder: (_, __) => const CircularProgressIndicator(),
          imageBuilder: (_, image) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(image: image),
            );
          },
          errorWidget: (_, __, ___) => Text('Error'),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'O duque e eu (Os Bridgertons)',
            style: TextStyle(
              color: AppColors.accentColor.withOpacity(1),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          'Julia Quinn',
          style: TextStyle(
            color: AppColors.accentColor.withOpacity(1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  PreferredSizeWidget _bottomAppBar() {
    return TabBar(
      indicatorWeight: 4,
      indicator: MaterialIndicator(),
      padding: const EdgeInsets.only(right: 70),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.primaryColor,
      tabs: <Widget>[
        _tabBar(title: 'Meus livros'),
        _tabBar(title: 'Emprestados'),
      ],
    );
  }

  Widget _tabBar({required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      alignment: Alignment.centerLeft,
      child: Tab(
        child: Text(
          title,
          style: TextStyle(color: AppColors.accentColor.withOpacity(1.0)),
        ),
      ),
    );
  }
}

class MaterialIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final height = 4.0;
  final topRightRadius = 2.0;
  final topLeftRadius = 2.0;
  final bottomRightRadius = 0.0;
  final bottomLeftRadius = 0.0;
  final color = AppColors.primaryColor;
  final horizontalPadding = 0.0;
  final paintingStyle = PaintingStyle.fill;
  final strokeWidth = 2.0;
  final MaterialIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Size mysize =
        Size(configuration.size!.width - (horizontalPadding * 2), height);

    Offset myoffset = Offset(
      offset.dx + (horizontalPadding),
      offset.dy + configuration.size!.height - height,
    );

    final Rect rect = myoffset & mysize;
    final Paint paint = Paint();
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = strokeWidth;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          bottomRight: Radius.circular(bottomRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
        paint);
  }
}
