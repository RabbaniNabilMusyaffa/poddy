import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poddy_proto/extensions.dart';
import 'package:poddy_proto/timer_settings.dart';
import 'package:poddy_proto/views/home.dart';
import 'package:poddy_proto/views/number_page.dart';
import '../widgets/round-button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class PomodorTimer extends StatefulWidget {
  final String timerTitle;
  final TimerSettings timerSettings;

  const PomodorTimer({
    Key? key,
    required this.timerTitle,
    required this.timerSettings,
  }) : super(key: key);

  @override
  _PomodorTimerState createState() => _PomodorTimerState();
}

typedef TimerCompleteCallback = void Function();

class _PomodorTimerState extends State<PomodorTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  int mainMinuteValue = 0;
  int mainSecondValue = 0;
  int breakMinuteValue = 0;
  int breakSecondValue = 0;
  String timeFormat = "Main";

  bool isPlaying = false;

  bool isMainTimer = true;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  Duration userInputtedDuration = Duration.zero;

  void resetTimerDuration(Duration newDuration) {
    controller.reset();
    setState(() {
      controller.duration = newDuration;
    });
  }

  void notify() {
    if (countText == '00:00') {
      FlutterRingtonePlayer.playNotification();
      controller.reset();
      setState(() {
        isPlaying = false;
      });

      if (isMainTimer) {
        // Switch to the break timer
        resetTimerDuration(Duration(
          minutes: widget.timerSettings.breakMinute,
          seconds: widget.timerSettings.breakSecond,
        ));
        isMainTimer = false;
        controller.reverse(from: 1.0);
        setState(() {
          isPlaying = true;
        });
      } else {
        // Reset the break timer to the user-inputted value
        resetTimerDuration(Duration(
          minutes: widget.timerSettings.mainMinute,
          seconds: widget.timerSettings.mainSecond,
        ));
        isMainTimer = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        minutes: widget.timerSettings.mainMinute,
        seconds: widget.timerSettings.mainSecond,
      ),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });

    String timeFormat = "Main"; // Initial value
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: '#181922'.toColor(),
        elevation: 0.0,
        title: Container(
          width: 370,
          height: 37,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Container(
                width: 150,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Poddy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '/ Active',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4000000059604645),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 20,
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      child: Stack(children: [
                        Icon(
                          Icons.settings_rounded,
                          size: 18,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: '#181922'.toColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 370,
              height: 110,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'CURRENT TASK',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.timerTitle}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            // Timer
            Padding(padding: EdgeInsets.only(top: 50)),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade300,
                      value: progress,
                      strokeWidth: 6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.isDismissed) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 300,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.ms,
                              initialTimerDuration: Duration(
                                minutes: timeFormat == "Main"
                                    ? widget.timerSettings.mainMinute
                                    : widget.timerSettings.breakMinute,
                                seconds: timeFormat == "Main"
                                    ? widget.timerSettings.mainSecond
                                    : widget.timerSettings.breakSecond,
                              ),
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  if (timeFormat == "Main") {
                                    // Update the timer settings based on timeFormat
                                    widget.timerSettings.mainMinute =
                                        time.inMinutes;
                                    widget.timerSettings.mainSecond =
                                        time.inSeconds % 60;
                                  } else {
                                    widget.timerSettings.breakMinute =
                                        time.inMinutes;
                                    widget.timerSettings.breakSecond =
                                        time.inSeconds % 60;
                                  }
                                  userInputtedDuration = time;
                                  controller.duration = time;
                                });
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => Text(
                        countText,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      '$timeFormat session',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Controller
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: RoundButton(
                    icon: Icons.home_rounded,
                    buttonColor: const Color.fromARGB(255, 131, 131, 131),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // Replace NewPage with your actual page widget
                            Home(
                          timerTitle:
                              "Presentasi Poddy", // Provide a default value
                          timerSettings: TimerSettings(
                            mainMinute: 0,
                            mainSecond: 0,
                            breakMinute: 0,
                            breakSecond: 0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                    width: 20), // Add a gap of 20 units between the buttons
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                    } else {
                      if (isMainTimer) {
                        // Start the main timer countdown
                        controller.reverse(
                            from:
                                controller.value == 0 ? 1.0 : controller.value);
                      }
                    }
                    setState(() {
                      isPlaying = true;
                    });
                  },
                  child: RoundButton(
                    icon: isPlaying == true
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    buttonColor: Colors.white,
                  ),
                ),
                SizedBox(width: 20), // Add another gap of 20 units
                GestureDetector(
                  onTap: () {
                    if (userInputtedDuration == Duration.zero) {
                      resetTimerDuration(Duration(
                        minutes: isMainTimer
                            ? widget.timerSettings.mainMinute
                            : widget.timerSettings.breakMinute,
                        seconds: isMainTimer
                            ? widget.timerSettings.mainSecond
                            : widget.timerSettings.breakSecond,
                      ));
                    } else {
                      resetTimerDuration(userInputtedDuration);
                    }
                    isPlaying = false;
                  },
                  child: RoundButton(
                    icon: Icons.stop_rounded,
                    buttonColor: const Color.fromARGB(255, 131, 131, 131),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            )
          ],
        ),
      ),
    );
  }
}
