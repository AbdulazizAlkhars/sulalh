import 'package:flutter/material.dart';

import 'package:hathera_demo/Profile/AuthorizationMethods/AddNewPhoneOTP.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class AddNewPhoneNumber extends StatefulWidget {
  final Function(String) onPhoneNumberUpdated;

  const AddNewPhoneNumber({super.key, required this.onPhoneNumberUpdated});

  @override
  State<AddNewPhoneNumber> createState() => _AddNewPhoneNumber();
}

class _AddNewPhoneNumber extends State<AddNewPhoneNumber> {
  String selectedCountryCode = '+971'; // Ini
  final TextEditingController _phoneNumberController = TextEditingController();
  void _showCountryCodeSelection() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.5;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: sheetHeight,
          child: ListView(
            children: [
              ListTile(
                title: const Text('+971'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+971';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+966'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+966';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+965'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+965';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+964'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+964';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+975'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+975';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+976'),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+976';
                  });
                  Navigator.pop(context);
                },
              ),
              // Add more Middle East country codes as needed
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add Phone Number',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Please enter your phone number - we will send a verification code to it.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Once you confirm your phone number, you will be able to use it as another way to sign in to your account.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: GestureDetector(
                                onTap: _showCountryCodeSelection,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    // color: Colors.white,
                                  ),
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 12),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedCountryCode,
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                        const Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                                child: TextField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Phone Number',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ButtonWidget(
                onPressed: () {
                  String phoneNumber = _phoneNumberController.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewPhoneOTP(
                        phoneNumber: phoneNumber,
                        onPhoneNumberUpdated: widget.onPhoneNumberUpdated,
                      ),
                    ),
                  );
                },
                buttonText: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
