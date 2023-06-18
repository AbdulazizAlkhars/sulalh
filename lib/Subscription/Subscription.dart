import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Your Subscription',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 85,
                width: double.infinity,
                // padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 36, 86, 38),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Standard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Monthly Subscription',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const ListTile(
              title: Text('Next Payment On'),
              trailing: Text(
                '12.12.2024',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const ListTile(
              title: Text('Amount To Pay'),
              trailing: Text(
                '\$29.00',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Credit Card'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Visa 9876',
                    style: TextStyle(fontSize: 14),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 28, 121, 65),
                    ),
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 241, 241, 241),
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Cancel Subscription',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            // Add your widgets here
          ],
        ),
      ),
    );
  }
}
