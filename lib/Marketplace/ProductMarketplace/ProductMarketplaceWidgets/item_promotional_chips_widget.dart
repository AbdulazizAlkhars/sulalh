import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class ItemPromotionalChipsWidget extends StatelessWidget {
  final String promotiontag;
  final TextStyle? textStyle; // Add a new property for text style

  ItemPromotionalChipsWidget({required this.promotiontag, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> promotiontagColors = {
      'Best Seller': AppColors.primary30,
      'Sale': AppColors.error100,
      'Promoted': AppColors.secondary50,
      // Add more status-color pairs as needed
    };

    // Get the color corresponding to the status
    final Color chipColor = promotiontagColors.containsKey(promotiontag)
        ? promotiontagColors[promotiontag]!
        : Colors.grey;

    // Determine font color based on status
    final Color fontColor =
        promotiontag == 'Sale' || promotiontag == 'Best Seller'
            ? Colors.white
            : AppColors.grayscale90;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        promotiontag.tr,
        style: textStyle != null
            ? textStyle!.copyWith(
                color: fontColor) // Apply custom text style with font color
            : AppFonts.caption2(
                color:
                    fontColor), // Use default text style if custom not provided
      ),
    );
  }
}
