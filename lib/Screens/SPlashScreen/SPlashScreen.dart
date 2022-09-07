// ignore_for_file: camel_case_types, file_names, deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moharak/Screens/Home/Home.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(247),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/5.png'),
              height: 300.0,
              width: 300.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: LinearPercentIndicator(
                    width: 200.0,
                    lineHeight: 15.0,
                    percent: 1,
                    animation: true,
                    animationDuration: 3000,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
