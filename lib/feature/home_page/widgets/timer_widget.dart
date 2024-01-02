import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final int value; // Value should be between 0 and 1
  final int totalSegments;
  final Color fillColor;
  final double strokeWidth;

  const TimerWidget({
    Key? key,
    required this.value,
    this.totalSegments = 5,
    this.fillColor = Colors.green,
    this.strokeWidth = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
              value: (value.toDouble() * (100 / totalSegments)) / 100,
              strokeWidth: strokeWidth,
              backgroundColor: Colors.grey.shade300,
              color: fillColor,
              valueColor: AlwaysStoppedAnimation<Color>(fillColor),
            ),
          ),
          Text(
            "0.0${value}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: fillColor,
            ),
          ),
        ],
      ),
    );
  }
}
