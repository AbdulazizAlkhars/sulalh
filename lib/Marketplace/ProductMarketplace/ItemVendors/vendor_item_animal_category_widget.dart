import 'package:flutter/material.dart';

import '../../../Theme/Colors.dart';
import '../../../Theme/Fonts.dart';

class VendorAnimalCategory extends StatefulWidget {
  const VendorAnimalCategory({Key? key}) : super(key: key);

  @override
  _VendorAnimalCategoryState createState() => _VendorAnimalCategoryState();
}

class _VendorAnimalCategoryState extends State<VendorAnimalCategory> {
  late List<String> selectedAnimalCategories;
  bool allSelected = false;

  @override
  void initState() {
    super.initState();
    selectedAnimalCategories = [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Category Of Animals',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: animalCategoryItems.length,
              itemBuilder: (context, index) {
                final categoryName = animalCategoryItems[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    categoryName,
                    style: AppFonts.body2(
                      color: AppColors.grayscale90,
                    ),
                  ),
                  trailing: Checkbox(
                    activeColor: AppColors.primary30,
                    value: allSelected ||
                        selectedAnimalCategories.contains(categoryName),
                    onChanged: (value) {
                      setState(() {
                        if (categoryName == 'All') {
                          allSelected = value!;
                          if (value) {
                            selectedAnimalCategories =
                                List.from(animalCategoryItems);
                          } else {
                            selectedAnimalCategories.clear();
                          }
                        } else {
                          if (value!) {
                            selectedAnimalCategories.add(categoryName);
                          } else {
                            selectedAnimalCategories.remove(categoryName);
                          }
                          allSelected = selectedAnimalCategories.length ==
                              animalCategoryItems.length - 1;
                        }
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      if (categoryName == 'All') {
                        allSelected = !allSelected;
                        if (allSelected) {
                          selectedAnimalCategories =
                              List.from(animalCategoryItems);
                        } else {
                          selectedAnimalCategories.clear();
                        }
                      } else {
                        if (selectedAnimalCategories.contains(categoryName)) {
                          selectedAnimalCategories.remove(categoryName);
                          allSelected = false;
                        } else {
                          selectedAnimalCategories.add(categoryName);
                          allSelected = selectedAnimalCategories.length ==
                              animalCategoryItems.length - 1;
                        }
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> animalCategoryItems = [
  'All',
  'Cat',
  'Dog',
  'Sheep',
  'Cow',
  'Horse',
  'Chicken',
];
