import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poddy_proto/extensions.dart';
import '../widgets/round-button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class PomodorTimer extends StatefulWidget {
  const PomodorTimer({Key? key}) : super(key: key);

  @override
  _PomodorTimerState createState() => _PomodorTimerState();
}

typedef TimerCompleteCallback = void Function();

class _PomodorTimerState extends State<PomodorTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  bool isMainTimer = true;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  final Duration initialDuration = Duration(minutes: 25);

  final Duration breakDuration = Duration(minutes: 5);

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
        resetTimerDuration(breakDuration);
        isMainTimer = false;
        controller.reverse(from: 1.0);
        setState(() {
          isPlaying = true;
        });
      } else {
        // Reset the break timer to the user-inputted value
        resetTimerDuration(userInputtedDuration);
        isMainTimer = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: initialDuration,
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
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Presentasi Poddy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Timer
            const Spacer(),
            GestureDetector(
                onTap: () {
                  if (controller.isDismissed) {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                            height: 300,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.ms,
                              initialTimerDuration: controller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  userInputtedDuration = time;
                                  controller.duration = time;
                                });
                              },
                            )));
                  }
                },
                child: Column(
                  children: [
                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) => Text(countText,
                            style: TextStyle(
                                fontSize: 70,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    Text(
                      '6 of 10 session',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )),
            const Spacer(),

            // Controller
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  icon: Icons.fast_rewind_rounded,
                  buttonColor: const Color.fromARGB(255, 131, 131, 131),
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
                      isPlaying = !isPlaying;
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
                      resetTimerDuration(initialDuration);
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
