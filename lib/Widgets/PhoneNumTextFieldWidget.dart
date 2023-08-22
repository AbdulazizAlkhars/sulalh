import 'package:flutter/material.dart';

class PhoneNumberInputWidget extends StatefulWidget {
  const PhoneNumberInputWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberInputWidgetState createState() => _PhoneNumberInputWidgetState();
}

class _PhoneNumberInputWidgetState extends State<PhoneNumberInputWidget> {
  String selectedCountryCode = '+971'; // Initial selected country code
  TextEditingController phoneNumberController = TextEditingController();

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
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 12),
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
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
