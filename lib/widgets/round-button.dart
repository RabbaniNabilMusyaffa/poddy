import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
    required this.buttonColor,
  }) : super(key: key);
  final IconData icon;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: buttonColor, // Set the background color
        child: Icon(
          icon,
          size: 50,
          color: Colors.black, // You can customize the icon color here
        ),
      ),
    );
  }
}
