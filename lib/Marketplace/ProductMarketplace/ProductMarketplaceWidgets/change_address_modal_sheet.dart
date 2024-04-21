import 'package:flutter/material.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../add_new_address.dart';

class ChangeAddressModal extends StatefulWidget {
  const ChangeAddressModal({Key? key}) : super(key: key);

  @override
  _ChangeAddressModalState createState() => _ChangeAddressModalState();
}

class _ChangeAddressModalState extends State<ChangeAddressModal> {
  String? selectedAddress;

  final List<String> addresses = [
    'Shuwaikh, P O Box: 66116 Bayan, 43752',
    '1059 RAS AL KHAIMA, RAS AL KHAIMA',
    'P O Box: 3389 Safat, 13034',
    'Shuwaikh Industry 81001',
    '10559 RAS AL KHAIMA, RAS AL KHAIMA',
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                'Change Address',
                style: AppFonts.title4(color: AppColors.grayscale90),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: addresses.map((address) {
                    bool isSelected = selectedAddress == address;
                    return Dismissible(
                      key: Key(address),
                      onDismissed: (direction) {
                        setState(() {
                          addresses.remove(address);
                          if (selectedAddress == address) {
                            selectedAddress = null;
                          }
                        });
                      },
                      background: Container(color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAddress = address;
                            });
                          },
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.064, // Adjust the width as needed
                                  height: MediaQuery.of(context).size.width *
                                      0.064, // Adjust the height as needed
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.primary20
                                          : AppColors.grayscale30,
                                      width: isSelected ? 6.0 : 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  address,
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNewAddress()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary50,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Add New Address',
                    style: AppFonts.body1(color: AppColors.grayscale0),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
