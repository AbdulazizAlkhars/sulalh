import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import '../../../Theme/Colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.maxLines, // Add maxLines parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          maxLines: maxLines, // Set maxLines property
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
