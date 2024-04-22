import 'package:flutter/material.dart';
import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';
import '../../Lists.dart';
import '../add_new_address.dart';

class SelectYourAnimalModal extends StatefulWidget {
  const SelectYourAnimalModal({Key? key}) : super(key: key);

  @override
  _SelectYourAnimalModalState createState() => _SelectYourAnimalModalState();
}

class _SelectYourAnimalModalState extends State<SelectYourAnimalModal> {
  String? selectedAnimal;

  final List<String> animals = [
    'Puppy',
    'Tommy',
    'Jack',
    'Harry',
    'Shazam',
    'Kenneth',
    'Jerry',
    'Tom',
    'Melika',
    'Adam',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Text(
              'Select Your Animal',
              style: AppFonts.title4(color: AppColors.grayscale90),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: animals.map((address) {
                  bool isSelected = selectedAnimal == address;
                  return Dismissible(
                    key: Key(address),
                    onDismissed: (direction) {
                      setState(() {
                        animals.remove(address);
                        if (selectedAnimal == address) {
                          selectedAnimal = null;
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
                            selectedAnimal = address;
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
            Text(
              'Select By Species',
              style: AppFonts.title4(color: AppColors.grayscale90),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: animalspecies.entries.map((entry) {
                  final categoryName = entry.key;
                  final iconData = entry.value;
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1.0), // Adjust horizontal padding
                      child: SizedBox(
                        height: 100,

                        width: 100, // Set fixed width for each item
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Icon(
                                iconData,
                                size: 30,
                                color: AppColors.primary30,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              child: Text(
                                categoryName,
                                style: const TextStyle(fontSize: 12),

                                textAlign:
                                    TextAlign.center, // Center align text
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
              height: 25,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Add New Animal',
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
    );
  }
}
