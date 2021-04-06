import 'package:flutter/material.dart';
import 'package:flutter_advanced_progress/flutter_advanced_progress.dart';

class ExamplesPage extends StatefulWidget {
  @override
  _ExamplesPageState createState() => _ExamplesPageState();
}

class _ExamplesPageState extends State<ExamplesPage>
    with TickerProviderStateMixin {
  late AnimationController _primaryAnimController;
  late AnimationController _secondaryAnimController;
  int _sliderAmount = 75;
  int _division = 15;

  @override
  void initState() {
    super.initState();

    _primaryAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      value: 0.8,
    );

    _secondaryAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      value: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Colors.black87, Colors.black12],
                      center: Alignment.bottomCenter,
                      radius: 1.5,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 16.0,
                        offset: Offset(8.0, 8.0),
                      )
                    ],
                  ),
                  child: AnimatedBuilder(
                    animation: _primaryAnimController,
                    builder: (context, child) {
                      return AnimatedBuilder(
                        animation: _secondaryAnimController,
                        builder: (context, child) {
                          final celsius = (300 * _primaryAnimController.value)
                              .toStringAsFixed(0);

                          return AdvancedProgress(
                            levelAmount: _sliderAmount,
                            division: _division,
                            primaryValue: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).evaluate(_primaryAnimController),
                            secondaryValue: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).evaluate(_secondaryAnimController),
                            radius: 100.0,
                            levelLowHeight: 16,
                            levelHighHeight: 20,
                            primaryColor: Colors.yellow,
                            secondaryColor: Colors.red,
                            tertiaryColor: Colors.grey.withOpacity(0.25),
                            child: Stack(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '$celsius°',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 36,
                                        ),
                                      ),
                                      Text(
                                        'PREHEATING',
                                        style: TextStyle(
                                          height: 2,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '35:00',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        'Time left',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Slider(
                        value: _sliderAmount.toDouble(),
                        min: 0,
                        max: 200,
                        onChanged: (value) => setState(() {
                          _sliderAmount = value.toInt();
                        }),
                      ),
                      AnimatedBuilder(
                        animation: _primaryAnimController,
                        builder: (context, child) {
                          return Slider(
                            value: _primaryAnimController.value,
                            onChanged: (value) => setState(() {
                              _primaryAnimController.value = value;
                            }),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _secondaryAnimController,
                        builder: (context, child) {
                          return Slider(
                            value: _secondaryAnimController.value,
                            onChanged: (value) => setState(() {
                              _secondaryAnimController.value = value;
                            }),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                        ),
                        child: ElevatedButton(
                          onPressed: _handleDemoPressed,
                          child: Text('Demo'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdvancedProgress(
                  division: 5,
                  primaryValue: 0.75,
                  radius: 50.0,
                  levelAmount: 50,
                  levelLowHeight: 16,
                  levelHighHeight: 20,
                  primaryColor: Colors.green,
                  secondaryColor: Colors.red,
                  tertiaryColor: theme.hintColor,
                ),
                AdvancedProgress(
                  secondaryValue: 0.75,
                  secondaryWidth: 10.0,
                  radius: 50.0,
                  primaryColor: Colors.green,
                  secondaryColor: Colors.red,
                  tertiaryColor: theme.hintColor,
                ),
                AdvancedProgress(
                  radius: 50.0,
                  division: 5,
                  primaryValue: 1.0,
                  secondaryValue: 1.0,
                  levelAmount: 50,
                  primaryColor: Colors.black,
                  secondaryColor: Colors.white,
                  tertiaryColor: theme.hintColor,
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdvancedProgress(
                  division: 5,
                  primaryValue: 0.75,
                  radius: 50.0,
                  startAngle: -270,
                  maxDegrees: 180,
                  levelAmount: 50,
                  levelLowHeight: 16,
                  levelHighHeight: 20,
                  primaryColor: Colors.green,
                  secondaryColor: Colors.red,
                  tertiaryColor: theme.hintColor,
                ),
                AdvancedProgress(
                  division: 5,
                  primaryValue: 0.75,
                  radius: 50.0,
                  startAngle: -90,
                  maxDegrees: 180,
                  levelAmount: 50,
                  levelLowHeight: 16,
                  levelHighHeight: 20,
                  primaryColor: Colors.green,
                  secondaryColor: Colors.red,
                  tertiaryColor: theme.hintColor,
                ),
                AdvancedProgress(
                  division: 5,
                  primaryValue: 0.75,
                  radius: 50.0,
                  startAngle: 270,
                  maxDegrees: -180,
                  levelAmount: 50,
                  levelLowHeight: 16,
                  levelHighHeight: 20,
                  primaryColor: Colors.green,
                  secondaryColor: Colors.red,
                  tertiaryColor: theme.hintColor,
                ),
                AdvancedProgress(
                  division: 5,
                  primaryValue: 0.75,
                  radius: 50.0,
                  startAngle: 90,
                  maxDegrees: -180,
                  levelAmount: 50,
                  levelLowHeight: 16,
                  levelHighHeight: 20,
                  primaryColor: Colors.green,
                  secondaryColor: Colors.red,
                  tertiaryColor: theme.hintColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleDemoPressed() {
    _primaryAnimController.value = 0.0;
    _primaryAnimController.animateTo(
      0.8,
      duration: Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );

    _secondaryAnimController.value = 0.0;
    _secondaryAnimController.animateTo(
      0.8,
      duration: Duration(milliseconds: 4000),
      curve: Curves.linearToEaseOut,
    );
  }
}
