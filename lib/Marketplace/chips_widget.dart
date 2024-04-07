import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';

class ChipsWidget extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const ChipsWidget({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.grayscale10,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
