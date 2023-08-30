import 'package:flutter/material.dart';
import 'package:poddy_proto/timer_settings.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:poddy_proto/views/pomodor-timer.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  // var hour = 0;
  int mainMinute = 0;
  int mainSecond = 0;
  int breakMinute = 0;
  int breakSecond = 0;
  var timeFormat = "Main";

  TimerSettings get timerSettings => TimerSettings(
        mainMinute: mainMinute,
        mainSecond: mainSecond,
        breakMinute: breakMinute,
        breakSecond: breakSecond,
      );
  String timerTitle = ""; // Variable to store the entered title

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Unfocus the keyboard when user taps outside the text field
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 24, 25, 34),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 24, 25, 34),
            elevation: 0.0,
            title: Container(
              width: 370,
              height: 37,
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Create new timer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 16,
                    height: 16,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(child: Stack(children: [])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: 362,
                  height: 43,
                  padding: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFF20212E),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF383B4E)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                          onChanged: (value) {
                            setState(() {
                              timerTitle = value; // Store the entered title
                            });
                          },
                          decoration: InputDecoration(
                              hintText:
                                  'Masukkan judul timer', // Placeholder text
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 100)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Silahkan atur timer anda ${(timeFormat == "Main" ? mainMinute : breakMinute).toString().padLeft(2, '0')}:${(timeFormat == "Main" ? mainSecond : breakSecond).toString().padLeft(2, "0")} untuk timer $timeFormat",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Inter')),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value:
                                timeFormat == "Main" ? mainMinute : breakMinute,
                            zeroPad: true,
                            infiniteLoop: true,
                            itemWidth: 80,
                            itemHeight: 60,
                            onChanged: (value) {
                              setState(() {
                                if (timeFormat == "Main") {
                                  mainMinute = value;
                                } else {
                                  breakMinute = value;
                                }
                              });
                            },
                            textStyle: const TextStyle(
                                color: Colors.grey, fontSize: 20),
                            selectedTextStyle: const TextStyle(
                                color: Colors.white, fontSize: 30),
                            decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                  ),
                                  bottom: BorderSide(color: Colors.white)),
                            ),
                          ),
                          NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value:
                                timeFormat == "Main" ? mainSecond : breakSecond,
                            zeroPad: true,
                            infiniteLoop: true,
                            itemWidth: 80,
                            itemHeight: 60,
                            onChanged: (value) {
                              setState(() {
                                if (timeFormat == "Main") {
                                  mainSecond = value;
                                } else {
                                  breakSecond = value;
                                }
                              });
                            },
                            textStyle: const TextStyle(
                                color: Colors.grey, fontSize: 20),
                            selectedTextStyle: const TextStyle(
                                color: Colors.white, fontSize: 30),
                            decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                  ),
                                  bottom: BorderSide(color: Colors.white)),
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    timeFormat = "Main";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: timeFormat == "Main"
                                          ? Color.fromARGB(255, 1, 94, 170)
                                          : Colors.blue,
                                      border: Border.all(
                                        color: timeFormat == "Main"
                                            ? Color.fromARGB(255, 1, 94, 170)
                                            : Colors.blue,
                                      )),
                                  child: const Text(
                                    "Main",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    timeFormat = "Break";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: timeFormat == "Break"
                                        ? Color.fromARGB(255, 1, 94, 170)
                                        : Colors.blue,
                                    border: Border.all(
                                      color: timeFormat == "Break"
                                          ? Color.fromARGB(255, 1, 94, 170)
                                          : Colors.blue,
                                    ),
                                  ),
                                  child: const Text(
                                    "Break",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Button Create timer
          floatingActionButton: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PomodorTimer(
                      timerTitle: timerTitle,
                      timerSettings:
                          timerSettings), // Replace NewPage with your actual page widget
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Adjust the radius as needed
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 135,
                  vertical: 15), // Adjust the padding as needed
              primary: Colors.blue, // Change the button color
            ),
            child: Text(
              'Create Timer',
              style: TextStyle(fontFamily: 'inter', fontSize: 15),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
