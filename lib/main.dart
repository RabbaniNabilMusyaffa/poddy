import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:poddy_proto/timer_settings.dart';
import 'package:poddy_proto/views/home.dart';
import 'package:poddy_proto/views/pomodor-timer.dart';
import 'package:poddy_proto/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poddy ',
      home: AnimatedSplashScreen(
          backgroundColor: Color.fromARGB(255, 24, 25, 34),
          splash: Center(
            child: Container(child: Image.asset('lib/assets/abs046.png')),
          ),
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: Home(
            timerTitle: "Presentasi Poddy", // Provide a default value
            timerSettings: TimerSettings(
              mainMinute: 0,
              mainSecond: 0,
              breakMinute: 0,
              breakSecond: 0,
            ),
          )),
    );
  }
}
