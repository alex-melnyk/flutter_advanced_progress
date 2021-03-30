part of '../flutter_advanced_progress.dart';

class AdvancedProgress extends StatelessWidget {
  AdvancedProgress({
    Key key,
    @required this.levelAmount,
    @required this.radius,
    this.primaryValue,
    this.secondaryValue,
    this.secondaryWidth = 10.0,
    this.startAngle = 120.0,
    this.maxDegrees = 300.0,
    this.progressGap = 0.0,
    this.division = 10,
    this.levelWidth = 1.0,
    this.levelLow = 8.0,
    this.levelHigh = 16.0,
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.child,
  }) : super(key: key);

  final int levelAmount;
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
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final size = radius * 2;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: size,
      height: size,
      decoration: BoxDecoration(),
      child: CustomPaint(
        painter: AdvancedProgressPainter(
          amount: levelAmount,
          primaryValue: primaryValue,
          secondaryValue: secondaryValue,
          secondaryWidth: secondaryWidth,
          radius: radius,
          startAngle: startAngle,
          maxDegrees: maxDegrees,
          progressGap: progressGap,
          division: division,
          levelWidth: levelWidth,
          levelLow: levelLow,
          levelHigh: levelHigh,
          primaryColor: primaryColor ?? theme.indicatorColor,
          secondaryColor: secondaryColor ?? primaryColor,
          tertiaryColor: tertiaryColor ?? theme.hintColor,
        ),
        child: child,
      ),
    );
  }
}
