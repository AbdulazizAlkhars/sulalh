import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        child: SizedBox(
          child: Card(
            elevation: 0,
            color: AppColors.grayscale00,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery On March 7',
                  style: AppFonts.headline3(color: AppColors.grayscale90),
                ),
                SizedBox(
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
                      SizedBox(width: 10),
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
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '\$${widget.price * widget.quantity}',
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

  void _showDeleteConfirmation(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return IntrinsicHeight(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16)), // Rounded corners for the top
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
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
                SizedBox(
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
