import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomerSupportState createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;

  void _toggleExpansion1() {
    setState(() {
      _isExpanded1 = !_isExpanded1;
    });
  }

  void _toggleExpansion2() {
    setState(() {
      _isExpanded2 = !_isExpanded2;
    });
  }

  void _toggleExpansion3() {
    setState(() {
      _isExpanded3 = !_isExpanded3;
    });
  }

  void _toggleExpansion4() {
    setState(() {
      _isExpanded4 = !_isExpanded4;
    });
  }

  void _toggleExpansion5() {
    setState(() {
      _isExpanded5 = !_isExpanded5;
    });
  }

  void _showModalSheet() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.4;
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: sheetHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Contact Us'.tr,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/FAQs/WhatsappIcon.png',
                      width: 35, // Adjust the width as needed
                      height: 35, // Adjust the height as needed
                    ),
                    title: Text(
                      'WhatsApp'.tr,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text('Chat With Support'.tr),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle option 1 tap
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/FAQs/PhoneIcon.png',
                      width: 35, // Adjust the width as needed
                      height: 35, // Adjust the height as needed
                    ),
                    title: const Text(
                      '+965 96721717',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text('Call Us'.tr),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle option 1 tap
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 235, 235, 235),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'Cancel'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQs'.tr,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question #1'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (_isExpanded1) Text('Subtitle'.tr),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isExpanded1 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.green,
                  ),
                  onPressed: _toggleExpansion1,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question #2'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (_isExpanded2) Text('Subtitle'.tr),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isExpanded2 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.green,
                  ),
                  onPressed: _toggleExpansion2,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question #3'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (_isExpanded3) Text('Subtitle'.tr),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isExpanded3 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.green,
                  ),
                  onPressed: _toggleExpansion3,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question #4'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (_isExpanded4) Text('Subtitle'.tr),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isExpanded4 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.green,
                  ),
                  onPressed: _toggleExpansion4,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question #5'.tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (_isExpanded5) Text('Subtitle'.tr),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isExpanded5 ? Icons.arrow_upward : Icons.arrow_drop_down,
                    color: Colors.green,
                  ),
                  onPressed: _toggleExpansion5,
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ), // Added Expanded widget to fill remaining space
            Padding(
              padding: const EdgeInsets.all(16),
              child: ButtonWidget(
                onPressed: _showModalSheet, // Show modal sheet on button press
                buttonText: 'Need Help'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
