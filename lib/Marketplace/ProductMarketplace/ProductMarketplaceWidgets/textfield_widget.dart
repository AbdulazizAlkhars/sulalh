import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import '../../../Theme/Colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0), // Adjust border radius here
        border: Border.all(
          color: AppColors.grayscale20, // Outline color
        ),
        color: Colors.white, // Background color
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          style: TextStyle(fontSize: 14.0), // Adjust font size here
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppFonts.body2(color: AppColors.grayscale50),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
