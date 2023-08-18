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

class _PomodorTimerState extends State<PomodorTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
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
<<<<<<< HEAD
        title: Container(
          width: 315,
          height: 37,
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/sidebar-left.png', // Replace with the actual path to your custom icon image
                width: 24, // Customize the width of the icon
                height: 24, // Customize the height of the icon
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-3.14),
                child: Container(
                  width: 16,
                  height: 16,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        child: Stack(children: []),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              Container(width: 10, height: 10),
            ],
=======
        title: const Center(
          child: Text(
            'Poddy',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
>>>>>>> poddy/main
          ),
        ),
      ),
      backgroundColor: '#181922'.toColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
<<<<<<< HEAD
            Container(
              width: 370,
              height: 120,
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
                    'FE - Inspector / Sertifikat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                              initialTimerDuration: controller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
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
                    // ...
=======
            Center(
              child: Text(
                'Current Task',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(17.0),
              child: const Text(
                'Tugas PBO',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (controller.isDismissed) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                          height: 300,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          )));
                }
              },
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => Text(countText,
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the buttons horizontally
              children: [
                RoundButton(
                  icon: Icons.fast_rewind_rounded,
                  buttonColor: Colors.white, // Set the button color to white
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
>>>>>>> poddy/main
                  },
                  child: RoundButton(
                    icon: isPlaying == true
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    buttonColor: Colors.white,
                  ),
                ),
<<<<<<< HEAD
                SizedBox(width: 20), // Add another gap of 20 units
                GestureDetector(
                  onTap: () {
                    // ...
                  },
                  child: RoundButton(
                    icon: Icons.stop_rounded,
                    buttonColor: const Color.fromARGB(255, 131, 131, 131),
=======
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: RoundButton(
                    icon: Icons.stop_rounded,
                    buttonColor: Colors.white,
>>>>>>> poddy/main
                  ),
                ),
              ],
            ),
            SizedBox(
<<<<<<< HEAD
              height: MediaQuery.of(context).size.height / 10,
=======
              height: MediaQuery.of(context).size.height / 6,
>>>>>>> poddy/main
            )
          ],
        ),
      ),
    );
  }
}
