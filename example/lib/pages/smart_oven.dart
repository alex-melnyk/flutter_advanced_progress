import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_progress/flutter_advanced_progress.dart';

class SmartOverPage extends StatefulWidget {
  @override
  _SmartOverPageState createState() => _SmartOverPageState();
}

class _SmartOverPageState extends State<SmartOverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(128, 128, 138, 1),
                    Color.fromRGBO(53, 54, 62, 1),
                  ],
                  center: const Alignment(1, 1),
                  focal: const Alignment(-0.75, -0.75),
                  focalRadius: 1.0,
                ),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black38,
                    blurRadius: 16.0,
                    offset: const Offset(8.0, 8.0),
                  ),
                ],
              ),
              child: AdvancedProgress(
                radius: 120,
                levelAmount: 76,
                levelLowHeight: 16,
                levelHighHeight: 20,
                division: 15,
                secondaryWidth: 8,
                progressGap: 12,
                primaryValue: 1.0,
                secondaryValue: 1.0,
                primaryColor: Colors.yellow,
                secondaryColor: Colors.red,
                tertiaryColor: Colors.black12,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: Text(
                          ' 240°',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w400,
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: Text(
                          'PREHEATING',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 3.0,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w800,
                            fontSize: 8,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '35:00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white24,
                              ),
                            ),
                            Text(
                              'Time left',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.5,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                right: 60,
                top: 48,
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(25),
                    right: const Radius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Swipe to Stop',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.horizontal(
                          left: const Radius.circular(25),
                          right: const Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
