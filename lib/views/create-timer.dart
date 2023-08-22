import 'package:flutter/material.dart';
import 'package:poddy_proto/views/hours.dart';
import 'package:poddy_proto/views/minutes.dart';
import 'package:poddy_proto/views/tile.dart';

class CreateTimer extends StatelessWidget {
  const CreateTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
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
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFF303141),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'PRVT',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '>',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'New Timer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // clock wheel
            Container(
              height: 400, // Adjust the height as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // hours wheel
                  Container(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) => print(value),
                      itemExtent: 50,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 13,
                        builder: (context, index) {
                          return MyHours(
                            hours: index,
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    child: Center(
                      child: Text(
                        ':',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  //Minutes wheel
                  Container(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) => print(value),
                      itemExtent: 50,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 60,
                        builder: (context, index) {
                          return MyMinutes(
                            mins: index,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Button Create timer
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Add your button click logic here
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8), // Adjust the radius as needed
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 135, vertical: 15), // Adjust the padding as needed
          primary: Colors.blue, // Change the button color
        ),
        child: Text(
          'Create Timer',
          style: TextStyle(fontFamily: 'inter', fontSize: 15),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
