import 'package:coding_challenge_kjbn/utils/style_guide.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;

  PrimaryButton({
    required this.title,
    required this.onPressed,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Background color
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Rounded border with radius 10
        ),
      ),
      child: Text(
        title,
        style: btnTextWhite,
      ),
    );
  }
}
