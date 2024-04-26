// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class CartCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double price;
  int quantity;
  int discountprice;
  final Function(int) onQuantityChanged;
  final Function() onDelete; // Add onDelete callback

  CartCard({
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
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
      child: SizedBox(
        height: 130,
        child: Card(
          elevation: 0,
          color: AppColors.grayscale10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    widget.imagePath,
                    width: 130,
                    height: 130,
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
                        style: AppFonts.body2(color: AppColors.grayscale100),
                      ),
                      IntrinsicWidth(
                        child: Container(
                          height: 40,
                          width: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.grayscale20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (widget.quantity > 1) {
                                      widget.quantity--;
                                      widget.onQuantityChanged(widget.quantity);
                                    }
                                  });
                                },
                              ),
                              Text(
                                widget.quantity.toString(),
                                style: AppFonts.body2(
                                    color: AppColors.grayscale90),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.quantity++;
                                    widget.onQuantityChanged(widget.quantity);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
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
                          '\KD ${widget.price * widget.quantity}',
                          style: AppFonts.headline4(color: AppColors.primary40),
                        ),
                        Text(
                          '\KD ${widget.discountprice * widget.quantity}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.grayscale60,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.016),
                        decoration: BoxDecoration(
                          color: AppColors.grayscale10,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          size: 20,
                          Icons.delete_outline,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        _showDeleteConfirmation(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16)), // Rounded corners for the top
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Remove item \nfrom cart?',
                  style: AppFonts.title3(color: AppColors.grayscale90),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onDelete(); // Call onDelete callback
                        Navigator.pop(context); // Close modal
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.grayscale20,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: AppFonts.body1(color: AppColors.error100),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close modal
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.grayscale20,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: AppFonts.body1(color: AppColors.grayscale90),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
