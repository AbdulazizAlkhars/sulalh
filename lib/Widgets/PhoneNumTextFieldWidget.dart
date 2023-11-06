import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Widgets/CountriesWidget.dart';
import 'package:hathera_demo/data/countryDetails.dart';

class PhoneNumberInputWidget extends ConsumerStatefulWidget {
  const PhoneNumberInputWidget({super.key});

  @override
  _PhoneNumberInputWidgetState createState() => _PhoneNumberInputWidgetState();
}

class _PhoneNumberInputWidgetState
    extends ConsumerState<PhoneNumberInputWidget> {
  String selectedCountryCode = '+971'.tr; // Initial selected country code
  TextEditingController phoneNumberController = TextEditingController();

  String countryFlag = "assets/icons/flags/Country=SA.png";
  void _showCountryCodeSelection() async {
    final selectedCountryInfo = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: CountriesWidget(
            onCountrySelected: (CountryInfo countryInfo) {
              Navigator.pop(
                context,
                countryInfo,
              ); // Pass the selected country info back
            },
          ),
        );
      },
    );

    if (selectedCountryInfo != null) {
      // Update the selected country code
      ref
          .read(selectedCountryCodeProvider.notifier)
          .update((state) => selectedCountryInfo.countryCode);

      // Update the country flag
      setState(() {
        countryFlag = selectedCountryInfo.flagImagePath;
      });
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCountryCode = ref.watch(selectedCountryCodeProvider);
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
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
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        textDirection:
                            TextDirection.rtl, // Adjust icon direction
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025),
                          Image.asset(
                            countryFlag,
                            width: 24,
                          ),
                          Text(
                            selectedCountryCode,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
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
                onChanged: (value) {
                  ref
                      .read(phoneNumberProvider.notifier)
                      .update((state) => value);
                },
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
