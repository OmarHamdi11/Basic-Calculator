import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      this.height = 75,
      required this.callBack});

  final String text;
  final Color buttonColor;
  final double height;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(90),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      height: height,
      width: 90,
      child: TextButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
        onPressed: () => callBack(text),
      ),
    );
  }
}
