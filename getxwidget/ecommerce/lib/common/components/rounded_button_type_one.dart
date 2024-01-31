import 'package:flutter/material.dart';

class RoundedButtonTypeOne extends StatelessWidget {
  const RoundedButtonTypeOne(
      {required this.width,
        required this.onTap,
        required this.buttonText,
        Key? key})
      : super(key: key);

  final double width;
  final Function() onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.orange),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
