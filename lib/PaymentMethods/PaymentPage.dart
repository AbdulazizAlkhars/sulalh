import 'package:flutter/material.dart';
import 'package:hathera_demo/PaymentMethods/AddNewCardPage.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<CardInfo> savedCards = [
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Payment Methods',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Saved Cards:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: savedCards.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < savedCards.length) {
                    return Dismissible(
                      key: Key(savedCards[index].cardHolderName),
                      onDismissed: (direction) {
                        setState(() {
                          savedCards.removeAt(index);
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
                        cardInfo: savedCards[index],
                        onSelect: () {},
                      ),
                    );
                  } else {
                    return ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add New Card'),
                      trailing: const Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      onTap: () {
                        _navigateToAddCard();
                      },
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
                physics: const NeverScrollableScrollPhysics(),
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
              ButtonWidget(
                onPressed: () {},
                buttonText: 'Add New Payment Method',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAddCard() async {
    final newCardInfo = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCardPage()),
    );
    if (newCardInfo != null) {
      setState(() {
        savedCards.add(newCardInfo);
      });
    }
  }
}
