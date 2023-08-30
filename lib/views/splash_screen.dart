import 'package:flutter/material.dart';
import 'package:poddy_proto/timer_settings.dart';
import 'package:poddy_proto/views/pomodor-timer.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PomodorTimer(
          timerTitle: "Presentasi Poddy", // Provide a default value
          timerSettings: TimerSettings(
            mainMinute: 25,
            mainSecond: 00,
            breakMinute: 5,
            breakSecond: 00,
          ), // Provide default settings
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 25, 34),
      body: Center(
        child: Container(child: Image.asset('lib/assets/abs046.png')),
      ),
    );
  }
}
