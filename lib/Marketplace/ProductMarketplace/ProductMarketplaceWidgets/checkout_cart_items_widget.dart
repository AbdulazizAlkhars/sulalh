// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class CheckOutCartCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double price;
  int quantity;
  int discountprice;
  final Function(int) onQuantityChanged;
  final Function() onDelete; // Add onDelete callback

  CheckOutCartCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.discountprice,
    required this.onQuantityChanged,
    required this.onDelete, // Accept onDelete callback
  });
  @override
  State<CheckOutCartCard> createState() => _CheckOutCartCardState();
}

class _CheckOutCartCardState extends State<CheckOutCartCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
      child: IntrinsicHeight(
        child: Card(
          elevation: 0.2,
          color: AppColors.grayscale0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery On March 7',
                  style: AppFonts.headline3(color: AppColors.grayscale90),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${widget.quantity.toStringAsFixed(0)}\ Item',
                  style: AppFonts.caption3(color: AppColors.grayscale60),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image.asset(
                          widget.imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.productName,
                              style: AppFonts.caption2(
                                  color: AppColors.grayscale100),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${widget.price * widget.quantity} KD',
                                style: AppFonts.headline4(
                                    color: AppColors.primary40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
