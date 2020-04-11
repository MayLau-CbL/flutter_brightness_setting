import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundColorWidget extends StatefulWidget {
  final bool isDark;
  final AnimationController animationController;
  final Color lightColor;
  final Color darkColor;
  final Alignment alignment;

  BackgroundColorWidget(
      {@required this.animationController,
      this.isDark = false,
      this.lightColor = const Color(0xFFEEEEEE),
      this.darkColor = const Color(0xFF1A1A1A),
      this.alignment = Alignment.topLeft});

  @override
  _BackgroundColorWidgetState createState() => _BackgroundColorWidgetState();
}

class _BackgroundColorWidgetState extends State<BackgroundColorWidget> {
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation =
        Tween<double>(begin: 0, end: 1).animate(widget.animationController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: CustomPaint(
        size: Size(MediaQuery.of(context).size.width * _animation.value,
            MediaQuery.of(context).size.height * _animation.value),
        painter: _ElipsePainter(
            color: widget.isDark ? Color(0xFF1A1A1A) : Color(0xFFEEEEEE),
            alignment: widget.alignment,
            actualSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height)),
      ),
    );
  }
}

class _ElipsePainter extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final Size actualSize;

  _ElipsePainter(
      {@required this.color,
      @required this.alignment,
      @required this.actualSize})
      : assert(alignment != null, 'Aligment cannot be null.');

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.height > size.width ? size.height : size.width;
    Paint paint = new Paint()..color = this.color;
    canvas.drawCircle(
        getOffset(this.alignment, actualSize.width, actualSize.height),
        radius,
        paint);
  }

  Offset getOffset(Alignment alignment, double width, double height) {
    double dx, dy;
    if (alignment.x == -1) {
      dx = 0;
    } else if (alignment.x == 0) {
      dx = width / 2;
    } else if (alignment.x == 1) {
      dx = width;
    }
    if (alignment.y == -1) {
      dy = 0;
    } else if (alignment.y == 0) {
      dy = height / 4;
    } else if (alignment.y == 1) {
      dy = height / 4 * 3;
    }

    return Offset(dx, dy);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
