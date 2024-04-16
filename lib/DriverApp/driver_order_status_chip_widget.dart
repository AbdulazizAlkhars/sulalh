import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class DriverOrderStatusChip extends StatelessWidget {
  final String status;

  DriverOrderStatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColors = {
      'Waiting To Accept': AppColors.secondary30,
      'Accepted': AppColors.primary20,
      'Delivered': AppColors.grayscale40,
      // Add more status-color pairs as needed
    };

    // Get the color corresponding to the status
    final Color chipColor =
        statusColors.containsKey(status) ? statusColors[status]! : Colors.grey;

    // Determine font color based on status
    final Color fontColor =
        status == 'Accepted' ? Colors.white : AppColors.grayscale90;

    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        side: const BorderSide(
            color: Colors.transparent), // Make outline transparent
      ),
      backgroundColor: chipColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ), // Adjust padding as needed
      label: Text(
        status,
        style: AppFonts.caption2(
          color: fontColor, // Set font color based on status
        ),
      ),
    );
  }
}
