import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Calculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    //Minute Line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Colors.amber??Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
    );

    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // hour Line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Colors.black??Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round
    );

    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    double secondX =
        centerX + size.width * 0.45 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.45 * sin((dateTime.second * 6) * pi / 180);

    // Second Line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()
          ..color = Colors.red??Theme.of(context).primaryColor
          ..strokeWidth = 1
          ..strokeCap = StrokeCap.round
    );
    // To draw hour hand
    /*final Paint secondHandPaint= new Paint();
    final Paint secondHandPointsPaint= new Paint();
    secondHandPaint.color= Colors.red;
    secondHandPaint.style= PaintingStyle.stroke;
    secondHandPaint.strokeWidth= 2.0;

    secondHandPointsPaint.color=Colors.red;
    secondHandPointsPaint.style= PaintingStyle.fill;
    canvas.save();

    canvas.translate(centerX, centerX);


    canvas.rotate(2*pi*this.dateTime.second/60);

    Path path1= new Path();
    Path path2 = new Path();
    path1.moveTo(0.0, -centerX );
    path1.lineTo(0.0, centerX/4);

    path2.addOval(new Rect.fromCircle(radius: 7.0, center: new Offset(0.0, -centerX)));
    path2.addOval(new Rect.fromCircle(radius: 5.0, center: new Offset(0.0, 0.0)));

    canvas.drawPath(path1, secondHandPaint);
    canvas.drawPath(path2, secondHandPointsPaint);

    canvas.restore();*/
    // canvas.drawShadow(path, Colors.black, 2.0, false);

// center Dots
    Paint dotPainter = Paint()
      ..color = Colors.red??Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(center, 10, dotPainter);
    canvas.drawCircle(
        center, 8, Paint()..color = Colors.white??Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 5, dotPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
