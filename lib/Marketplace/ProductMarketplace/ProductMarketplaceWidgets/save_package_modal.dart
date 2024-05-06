import 'package:flutter/material.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../ProductMarketPlacePages/add_new_address.dart';
import 'textfield_widget.dart';

class SavePackageModal extends StatefulWidget {
  const SavePackageModal({Key? key}) : super(key: key);

  @override
  _SavePackageModalState createState() => _SavePackageModalState();
}

class _SavePackageModalState extends State<SavePackageModal> {
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
                'Create Package',
                style: AppFonts.title4(color: AppColors.grayscale90),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Easily store your current cart items for quick reordering in the future with just one tap.',
                style: AppFonts.body2(color: AppColors.grayscale90),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Enter The Name Of The Package',
                style: AppFonts.body1(
                  color: AppColors.grayscale90,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                hintText: 'Enter The Name Of The Package',
              ),
              const SizedBox(
                height: 35,
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
                    'Create Package',
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
