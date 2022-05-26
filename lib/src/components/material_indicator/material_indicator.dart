import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
