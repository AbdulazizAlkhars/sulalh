import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Profile/PaymentMethods/AddNewCardPage.dart';
import '../Theme/Colors.dart';
import '../Theme/Fonts.dart';
import 'Lists.dart';
import 'cart_card_widget.dart';
import 'checkout_cart_items_widget.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CardInfo> saveddCards = [
    CardInfo('John Doe', '**** **** **** 1234', '2020', '222'),
    CardInfo('Jane Smith', '**** **** **** 5678', '2121', '222'),
  ];

  List<String> otherPaymentMethods = [
    'PayPal',
    'Google Pay',
    'Apple Pay',
  ];
  List<String> paymentMethodIcons = [
    'assets/PaymentPNGs/PayPal.png',
    'assets/PaymentPNGs/GPay.png',
    'assets/PaymentPNGs/ApplePay.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Checkout',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Address',
                style: AppFonts.title4(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primary50,
                    ),
                    title: Text(
                      '10559 Ras Al Khaima, Ras Al Khaima',
                      style: AppFonts.body1(
                        color: AppColors.grayscale90,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close modal
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
                        'Change Address',
                        style: AppFonts.body1(color: AppColors.grayscale90),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Cart Items',
                style: AppFonts.title4(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 8.0), // Add space between cards
                    child: CheckOutCartCard(
                      imagePath: item.imagePath,
                      productName: item.productName,
                      price: item.price,
                      quantity: item.quantity,
                      onQuantityChanged: (newQuantity) {},
                      discountprice: item.discountedPrice,
                      onDelete: () => (item),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Methods',
                style: AppFonts.title4(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Credit Cards & Debit Cards',
                style: AppFonts.headline4(
                  color: AppColors.grayscale90,
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: saveddCards.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < saveddCards.length) {
                    return Dismissible(
                      key: Key(saveddCards[index].cardHolderName),
                      onDismissed: (direction) {
                        setState(() {
                          saveddCards.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: CardWidget(
                        cardInfo: saveddCards[index],
                        onSelect: () {},
                      ),
                    );
                  } else {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          width: MediaQuery.of(context).size.width * 0.08,
                          height: MediaQuery.of(context).size.width * 0.06,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.grayscale10,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: AppColors.primary30,
                          )),
                      title: Text(
                        'Add New Card',
                        style: AppFonts.body2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: AppColors.grayscale50,
                      ),
                      onTap: () {},
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Other Payment Methods:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: otherPaymentMethods.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < otherPaymentMethods.length) {
                    return ListTile(
                      leading: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(paymentMethodIcons[index]),
                      ),
                      title: Text(otherPaymentMethods[index]),
                      trailing: const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      onTap: () {
                        // Handle tapping on other payment methods
                      },
                    );
                  } else {
                    return const SizedBox(height: 30); // Add desired space here
                  }
                },
              ),
              const Card(
                elevation: 2,
                child: ListTile(
                  title: Text('Credit Card'),
                  trailing: Icon(Icons.credit_card),
                ),
              ),
              const Card(
                elevation: 2,
                child: ListTile(
                  title: Text('PayPal'),
                  trailing: Icon(Icons.payment),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout functionality
                },
                child: const Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfoo {
  final String cardHolderName;
  final String expiryDate;
  final String cardNumber;
  final String cvcNumber;

  CardInfoo(
      this.cardHolderName, this.cardNumber, this.cvcNumber, this.expiryDate);
}
