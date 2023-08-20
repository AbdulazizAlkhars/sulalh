import 'package:flutter/material.dart';

import 'package:hathera_demo/Profile/AuthorizationMethods/AddNewEmailOTP.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class AddNewEmail extends StatefulWidget {
  final Function(String) onEmailUpdated;

  const AddNewEmail({super.key, required this.onEmailUpdated});

  @override
  State<AddNewEmail> createState() => _AddNewEmail();
}

class _AddNewEmail extends State<AddNewEmail> {
  String selectedCountryCode = '+971'; // Ini
  final TextEditingController _emailController = TextEditingController();
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
    _emailController.dispose();
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
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Enter Email Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 12),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
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
                  String emailAddress = _emailController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewEmailOTP(
                        emailAddress: emailAddress,
                        onEmailUpdated: widget.onEmailUpdated,
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
