import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlacePages/checkout_item.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

import '../../Lists.dart';
import 'cart_card_widget.dart';

class PackageDetails extends StatefulWidget {
  final String packageName;
  final String packageAmount;

  const PackageDetails(
      {super.key, required this.packageName, required this.packageAmount});

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  double totalFinalAmount = 0;
  double totalGrossAmount = 0;
  double totaldiscount = 0;

  @override
  void initState() {
    super.initState();
    calculateFinalAmount();
    calculateAmountWithoutDiscount();
    calculateDisount();
  }

  void _deleteCartItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
      calculateFinalAmount();
      calculateAmountWithoutDiscount();
      calculateDisount();
    });
  }

  void calculateFinalAmount() {
    totalFinalAmount = cartItems.fold(
      0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );
  }

  void calculateAmountWithoutDiscount() {
    totalGrossAmount = cartItems.fold(
      0,
      (previousValue, item) =>
          previousValue +
          (item.price * item.quantity + item.discountedPrice * item.quantity),
    );
  }

  void calculateDisount() {
    totaldiscount = cartItems.fold(
      0,
      (previousValue, item) =>
          previousValue + (item.discountedPrice * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayscale00,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.packageName,
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
      body: Scrollbar(
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Items In The Package', // Your heading text
                        style: AppFonts.title5(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ), // Add space between cards
                      child: CartCard(
                        imagePath: item.imagePath,
                        productName: item.productName,
                        price: item.price,
                        quantity: item.quantity,
                        onQuantityChanged: (newQuantity) {
                          setState(() {
                            item.quantity = newQuantity;
                            calculateFinalAmount();
                            calculateAmountWithoutDiscount();
                          });
                        },
                        discountprice: item.discountedPrice,
                        onDelete: () => _deleteCartItem(item),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 2,
        child: IntrinsicHeight(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: AppFonts.body1(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          Text(
                            '${widget.packageAmount} KD',
                            style: AppFonts.title4(
                              color: AppColors.primary30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(
                                  totalAmount: totalFinalAmount,
                                  totalDiscount: totaldiscount,
                                  totalGrossAmount: totalGrossAmount,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.primary40,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Checkout',
                            style: AppFonts.body1(color: AppColors.grayscale0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
