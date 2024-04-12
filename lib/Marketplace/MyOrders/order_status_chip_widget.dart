import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class StatusChip extends StatelessWidget {
  final String status;

  StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColors = {
      'Created': AppColors.secondary30,
      'Delivered': AppColors.primary20,
      'Cancelled': AppColors.grayscale10,
      // Add more status-color pairs as needed
    };

    // Get the color corresponding to the status
    final Color chipColor =
        statusColors.containsKey(status) ? statusColors[status]! : Colors.grey;

    // Determine font color based on status
    final Color fontColor =
        status == 'Delivered' ? Colors.white : AppColors.grayscale90;

    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        side: const BorderSide(
            color: Colors.transparent), // Make outline transparent
      ),
      backgroundColor: chipColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ), // Adjust padding as needed
      label: Text(
        status,
        style: AppFonts.body2(
          color: fontColor, // Set font color based on status
        ),
      ),
    );
  }
}
