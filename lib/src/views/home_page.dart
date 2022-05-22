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
            bottom: TabBar(
              indicatorWeight: 4,
              indicator: MaterialIndicator(),
              padding: const EdgeInsets.only(right: 70),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.primaryColor,
              tabs: <Widget>[
                _tabBar(title: 'Meus livros'),
                _tabBar(title: 'Emprestados'),
              ],
            ),
          ),
        ),
      ),
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
          style: TextStyle(color: AppColors.primaryColor),
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
  final topRightRadius = 8.0;
  final topLeftRadius = 8.0;
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
