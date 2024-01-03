import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.text,
      this.bgColor = Colors.black,
      this.textSize = 18,
      this.textColor = Colors.white,
      required this.callback});
  final String text;
  final Color bgColor;
  final VoidCallback callback;
  final Color textColor;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: bgColor),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: textSize),
        ),
      ),
    );
  }
}
