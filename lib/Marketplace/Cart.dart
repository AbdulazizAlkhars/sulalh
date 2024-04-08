import 'package:flutter/material.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

import 'cart_card_widget.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> cartItems = [
    CartItem(
      productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
      price: 25.0,
      quantity: 2,
      discountedPrice: 10,
      imagePath: 'assets/Marketplace/Frame 1 5.png',
    ),
    CartItem(
      productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
      price: 10.0,
      quantity: 1,
      discountedPrice: 10,
      imagePath: 'assets/Marketplace/Frame 1 5.png',
    ),
    CartItem(
      productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
      price: 10.0,
      quantity: 1,
      discountedPrice: 10,
      imagePath: 'assets/Marketplace/Frame 1 5.png',
    ),
    CartItem(
      productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
      price: 10.0,
      quantity: 1,
      discountedPrice: 10,
      imagePath: 'assets/Marketplace/Frame 1 5.png',
    ),
    CartItem(
      productName: 'EquiGLOSS 2in1 Conditioning Shampoo',
      price: 10.0,
      quantity: 1,
      discountedPrice: 10,
      imagePath: 'assets/Marketplace/Frame 1 5.png',
    ),
  ];

  double totalAmount = 0;
  double totaldiscount = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalAmount();
    calculatediscount();
  }

  void calculateTotalAmount() {
    totalAmount = cartItems.fold(
      0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );
  }

  void calculatediscount() {
    totaldiscount = cartItems.fold(
      0,
      (previousValue, item) =>
          previousValue + (item.discountedPrice * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale10,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cart',
          style: AppFonts.headline3(
            color: AppColors.grayscale90,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Items', // Your heading text
                    style: AppFonts.title5(
                      color: AppColors.grayscale90,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: 8.0), // Add space between cards
                  child: CartCard(
                    imagePath: item.imagePath,
                    productName: item.productName,
                    price: item.price,
                    quantity: item.quantity,
                    onQuantityChanged: (newQuantity) {
                      setState(() {
                        item.quantity = newQuantity;
                        calculateTotalAmount();
                      });
                    },
                    discountprice: item.discountedPrice,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${totalAmount.toStringAsFixed(2)}',
                      style: AppFonts.title3(
                        color: AppColors.primary30,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '\$${totaldiscount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.grayscale50,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the action of the additional button
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.grayscale10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Added To Cart',
                          style: AppFonts.body1(color: AppColors.grayscale90),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Total',
                  style: AppFonts.body1(
                    color: AppColors.grayscale90,
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String productName;
  final double price;
  int quantity;
  final int discountedPrice;
  final String imagePath;

  CartItem({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.discountedPrice,
    required this.imagePath,
  });
}
