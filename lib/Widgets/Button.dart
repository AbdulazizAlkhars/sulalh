import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor = const Color.fromARGB(255, 36, 86, 38),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color.fromARGB(255, 36, 86, 38), // Button color
          foregroundColor: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
