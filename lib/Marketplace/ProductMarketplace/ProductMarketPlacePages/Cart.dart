import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Marketplace/ProductMarketplace/ProductMarketPlacePages/checkout_item.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';

import '../../Lists.dart';

import '../ProductMarketPlaceWidgets/cart_card_widget.dart';

import '../ProductMarketPlaceWidgets/save_package_modal.dart';
import '../ProductMarketPlaceWidgets/scrollable_product_cards_widget.dart';
import '../ProductMarketPlaceWidgets/your_packages.dart';

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
          'Cart'.tr,
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
        radius: const Radius.circular(20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items In The Cart'.tr,
                            style: AppFonts.title5(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.primary30,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    showDragHandle: true,
                                    context: context,
                                    backgroundColor: Colors.white,
                                    builder: (BuildContext context) {
                                      return const SavePackageModal();
                                    },
                                  );
                                },
                                child: Text(
                                  'Save Package'.tr,
                                  style: AppFonts.body1(
                                      color: AppColors.grayscale00),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                  physics: const NeverScrollableScrollPhysics(),
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
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: AppColors.grayscale20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Re-Order Your Packages'.tr,
                    style: AppFonts.title5(color: AppColors.grayscale90)),
                PackageListWidget(packages: packages),
                const Divider(
                  color: AppColors.grayscale20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Previously Bought For'.tr + 'Tommy',
                          style: AppFonts.title5(color: AppColors.grayscale90)),
                    ),
                    Text(
                      'See More'.tr,
                      style: AppFonts.body1(color: AppColors.primary40),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
      ),
      bottomNavigationBar: Material(
        elevation: 2,
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: AppColors.grayscale20),
              color: AppColors.grayscale00,
            ),
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
                            'Total'.tr,
                            style: AppFonts.body1(
                              color: AppColors.grayscale90,
                            ),
                          ),
                          Text(
                            '${totalFinalAmount.toStringAsFixed(2)}' + 'KD'.tr,
                            style: AppFonts.title4(
                              color: AppColors.primary30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${totalGrossAmount.toStringAsFixed(2)}' + 'KD'.tr,
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
                            'Checkout'.tr,
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
