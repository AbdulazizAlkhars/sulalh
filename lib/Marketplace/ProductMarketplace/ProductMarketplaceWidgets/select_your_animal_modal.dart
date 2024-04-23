import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool isExpanded = false;

  List<Map<String, dynamic>> myAnimals = [
    {
      'imageAsset': 'assets/avatars/120px/Cat.png',
      'name': 'Jack',
    },
    {
      'imageAsset': 'assets/avatars/120px/Chicken.png',
      'name': 'Sheru',
    },
    {
      'imageAsset': 'assets/avatars/120px/Cow.png',
      'name': 'Henry',
    },
    {
      'imageAsset': 'assets/avatars/120px/Sheep.png',
      'name': 'Kong',
    },
    {
      'imageAsset': 'assets/avatars/120px/Sheep.png',
      'name': 'Kong',
    },
    {
      'imageAsset': 'assets/avatars/120px/Sheep.png',
      'name': 'Kong',
    },
    {
      'imageAsset': 'assets/avatars/120px/Duck.png',
      'name': 'Eve',
    },
    {
      'imageAsset': 'assets/avatars/120px/Duck.png',
      'name': 'Eve',
    },
    {
      'imageAsset': 'assets/avatars/120px/Duck.png',
      'name': 'Eve',
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedAnimals =
        isExpanded ? myAnimals : myAnimals.take(5).toList();
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
              height: 10,
            ),
            Text(
              'When you select your animal, all the products will be filtered based on your animal details!!',
              style: AppFonts.body2(color: AppColors.grayscale90),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: displayedAnimals.map((myAnimal) {
                      bool isSelected = selectedAnimal == myAnimal['name'];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnimal = myAnimal['name'];
                            });
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.064,
                                backgroundImage:
                                    AssetImage(myAnimal['imageAsset']),
                              ),
                              const SizedBox(width: 15.0),
                              Expanded(
                                child: Text(
                                  myAnimal['name'],
                                  style: AppFonts.body2(
                                    color: AppColors.grayscale90,
                                  ),
                                ),
                              ),
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
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  if (myAnimals.length > 5)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'Show less' : 'Show all',
                        style: TextStyle(color: AppColors.primary30),
                      ),
                    ),
                ],
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
              height: 10,
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
