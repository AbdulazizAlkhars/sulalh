import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';

import '../../../Theme/Fonts.dart';

class TimeSlotChipsWidget extends StatefulWidget {
  final String label;
  final Function()? onTap;

  const TimeSlotChipsWidget({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  _TimeSlotChipsWidgetState createState() => _TimeSlotChipsWidgetState();
}

class _TimeSlotChipsWidgetState extends State<TimeSlotChipsWidget> {
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
          border: Border.all(color: AppColors.grayscale20),
          color: isSelected ? AppColors.secondary30 : AppColors.grayscale00,
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
