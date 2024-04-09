import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../Theme/Fonts.dart';

class ChipsWidget extends StatefulWidget {
  final String label;
  final Function()? onTap;

  const ChipsWidget({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  _ChipsWidgetState createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isSelected ? AppColors.secondary30 : AppColors.grayscale10,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Text(
            widget.label,
            style: AppFonts.body2(color: AppColors.grayscale100),
          ),
        ),
      ),
    );
  }
}
