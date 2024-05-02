import 'package:flutter/material.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/checkout_item.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

import '../Lists.dart';
import 'ProductMarketplaceWidgets/cart_card_widget.dart';
import 'ProductMarketplaceWidgets/column_product_card_widget.dart';
import 'ProductMarketplaceWidgets/filter_items_widget.dart';
import 'ProductMarketplaceWidgets/product_onegrid_widget.dart';
import 'ProductMarketplaceWidgets/product_twogrids_widget.dart';
import 'ProductMarketplaceWidgets/scrollable_product_cards_widget.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: Scrollbar(
        radius: Radius.circular(20),
        child: SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Items In The Cart', // Your heading text
                        style: AppFonts.title5(
                          color: AppColors.grayscale90,
                        ),
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
              Divider(
                color: AppColors.grayscale20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Previously Bought For Tommy',
                          style: AppFonts.title5(color: AppColors.grayscale90)),
                    ),
                    Text(
                      'See More',
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ],
                ),
              ),
              ScrollableProductCardsWidget(
                mainProductList: prevouslyBoughtProductList,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
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
                            '${totalFinalAmount.toStringAsFixed(2)} KD',
                            style: AppFonts.title4(
                              color: AppColors.primary30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${totalGrossAmount.toStringAsFixed(2)} KD',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.grayscale60,
                          decoration: TextDecoration.lineThrough,
                        ),
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
