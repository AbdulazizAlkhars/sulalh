import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberInputWidget extends StatefulWidget {
  const PhoneNumberInputWidget({super.key});

  @override
  _PhoneNumberInputWidgetState createState() => _PhoneNumberInputWidgetState();
}

class _PhoneNumberInputWidgetState extends State<PhoneNumberInputWidget> {
  String selectedCountryCode = '+971'.tr; // Initial selected country code
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
                title: Text('+971'.tr),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+971'.tr;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+966'.tr),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+966'.tr;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+965'.tr),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+965'.tr;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+964'.tr),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+964'.tr;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+975'.tr),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+975'.tr;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('+976'.tr),
                onTap: () {
                  setState(() {
                    selectedCountryCode = '+976'.tr;
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
      ),
      child: Row(
        textDirection:
            TextDirection.ltr, // Set the initial text direction to LTR
        children: [
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: _showCountryCodeSelection,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
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
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Adjust alignment
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        textDirection:
                            TextDirection.rtl, // Adjust icon direction
                      ),
                      Text(
                        selectedCountryCode,
                        style: const TextStyle(fontSize: 17),
                        textDirection:
                            TextDirection.ltr, // Adjust text direction
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr, // Set text direction to LTR
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number'.tr,
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
