import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

class CartCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  final double price;
  int quantity; // Change to non-final so it can be updated
  int discountprice;

  // Change the constructor to accept a Function that will be called when quantity changes
  CartCard({
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.discountprice,
    required this.onQuantityChanged,
  });

  // Add the function callback definition
  final Function(int) onQuantityChanged;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        elevation: 0,
        color: AppColors.grayscale00,
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
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productName,
                      style: AppFonts.body1(color: AppColors.grayscale100),
                    ),
                    IntrinsicWidth(
                      child: Container(
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.grayscale10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
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
                              style:
                                  AppFonts.body1(color: AppColors.grayscale90),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
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
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '\$${widget.price * widget.quantity}',
                        style: AppFonts.headline3(color: AppColors.primary40),
                      ),
                      Text(
                        '\$${widget.discountprice * widget.quantity}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grayscale50,
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
                        Icons.delete_outline,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      // Handle delete functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
