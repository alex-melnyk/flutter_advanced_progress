part of '../flutter_advanced_progress.dart';

class AdvancedProgressPainter extends CustomPainter {
  const AdvancedProgressPainter({
    this.amount,
    this.primaryValue,
    this.secondaryValue,
    this.secondaryWidth,
    this.radius,
    this.startAngle,
    this.maxDegrees,
    this.progressGap,
    this.division,
    this.levelWidth,
    this.levelLow,
    this.levelHigh,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
  });

  final int amount;
  final double primaryValue;
  final double secondaryValue;
  final double secondaryWidth;
  final double radius;
  final double startAngle;
  final double maxDegrees;
  final double progressGap;
  final int division;
  final double levelWidth;
  final double levelLow;
  final double levelHigh;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    _drawPrimaryProgress(canvas, size);
    _drawSecondaryProgress(canvas, size);
  }

  void _drawPrimaryProgress(Canvas canvas, Size size) {
    if (primaryValue == null) return;

    final secondarySpace = secondaryValue != null ? secondaryWidth + progressGap : 0.0;
    final extraSpace = max(levelHigh, levelLow) + secondarySpace;
    final activeRadius = radius - extraSpace;
    final anglePerItem = maxDegrees / amount;

    final paint = Paint()
      ..strokeWidth = levelWidth
      ..style = PaintingStyle.stroke
      ..color = tertiaryColor;

    for (var index = 0; index < amount; index++) {
      final angle = anglePerItem * index + startAngle + (anglePerItem / 2);
      final active =
          division != null && index > 0 ? index % division == 0 : false;

      final isFillWithColor =
          (index / amount) <= primaryValue && primaryValue != 0.0;

      canvas.save();

      paint.color = isFillWithColor
          ? ColorTween(
              begin: primaryColor,
              end: secondaryColor ?? primaryColor,
            ).transform(index / amount)
          : tertiaryColor;

      final offset = Offset(
        activeRadius * cos(pi * angle / 180) + activeRadius + extraSpace,
        activeRadius * sin(pi * angle / 180) + activeRadius + extraSpace,
      );

      canvas.translate(offset.dx, offset.dy);

      canvas.rotate(radians(angle));
      canvas.drawLine(
        Offset.zero,
        Offset(active ? levelHigh : levelLow, 0),
        paint,
      );

      canvas.restore();
    }
  }

  void _drawSecondaryProgress(Canvas canvas, Size size) {
    if (secondaryValue == null) return;

    final halfWidth = secondaryWidth / 2;
    final secondRect = Rect.fromLTWH(
      halfWidth,
      halfWidth,
      size.width - secondaryWidth,
      size.height - secondaryWidth,
    );

    final secondPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = secondaryWidth
      ..strokeCap = StrokeCap.round
      ..color = tertiaryColor;

    canvas.save();

    canvas.drawArc(
      secondRect,
      radians(startAngle),
      radians(maxDegrees),
      false,
      secondPaint,
    );

    secondPaint
      ..color = Colors.black
      ..shader = SweepGradient(
        colors: [
          primaryColor,
          secondaryColor ?? primaryColor,
        ],
        startAngle: radians(startAngle),
        endAngle: radians(maxDegrees),
        transform: GradientRotation(radians(startAngle - (secondaryWidth / 1.5))),
      ).createShader(secondRect);

    canvas.drawArc(
      secondRect,
      radians(startAngle),
      radians(maxDegrees * secondaryValue),
      false,
      secondPaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
