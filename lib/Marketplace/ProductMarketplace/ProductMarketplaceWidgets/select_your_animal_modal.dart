import 'package:flutter/cupertino.dart';
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
  late TextEditingController _searchController;
  List<Map<String, dynamic>> filteredAnimals = [];
  int selectedIndex = -1;
  int selectedSpeciesIndex = -1;
  String selectedBreed = '';

  @override
  void initState() {
    super.initState();
    filteredAnimals = myAnimals;
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredAnimals = myAnimals
          .where((animal) => animal['name']
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Select Your Animal',
                  style: AppFonts.title4(color: AppColors.grayscale90),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.primary50,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      'Select Animal',
                      style: AppFonts.body2(color: AppColors.grayscale00),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border:
                    Border.all(color: AppColors.grayscale20), // Outline color
                color: Colors.white, // Background color
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Search The Animal",
                  hintStyle: TextStyle(
                      color: AppColors.grayscale50), // Change hint text color
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary40,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'When you select your animal, all the products will be filtered based on your animal details!!',
              style: AppFonts.body2(color: AppColors.grayscale90),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: AppColors.grayscale20),
                color: AppColors.grayscale00,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: myAnimals.length,
                    itemBuilder: (context, index) {
                      final myAnimal = myAnimals[index];
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
                                    MediaQuery.of(context).size.width * 0.05,
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
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColors.grayscale20,
            ),
            Text(
              'Select By Species',
              style: AppFonts.title4(color: AppColors.grayscale90),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: animalSpecies.asMap().entries.map((speciesEntry) {
                      final int speciesIndex = speciesEntry.key;
                      final species = speciesEntry.value;
                      final speciesName = species['name'];
                      final speciesImageAsset = species['imageAsset'];

                      // Retrieve breeds for the current species

                      return Column(
                        children: [
                          // Display species icon and name
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSpeciesIndex = speciesIndex;
                                selectedBreed =
                                    ''; // Reset selected breed when changing species
                              });
                            },
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedSpeciesIndex ==
                                                  speciesIndex
                                              ? AppColors.primary20
                                                  .withOpacity(0.5)
                                              : Colors.transparent,
                                          spreadRadius: 5,
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage(speciesImageAsset),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Flexible(
                                    child: Text(
                                      speciesName,
                                      style: const TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Select Breed',
                  style: AppFonts.title5(color: AppColors.grayscale90),
                ),
                const SizedBox(height: 16),
                // Display breeds list below the species row
                if (selectedSpeciesIndex != -1 &&
                    animalSpecies.length > selectedSpeciesIndex)
                  breedsListWidget(
                    speciesBreeds[animalSpecies[selectedSpeciesIndex]
                            ['name']] ??
                        [],
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: AppColors.grayscale20),
                      color: AppColors.grayscale00,
                    ),
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.pets,
                          color: AppColors.primary20,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Center(
                          child: Text(
                            'Please select a species',
                            style: AppFonts.headline4(
                                color: AppColors.grayscale90),
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 16),
                // Display selected breed
              ],
            ),
            Text(
              selectedBreed,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  'Select Animal',
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

  Widget breedsListWidget(List<String> breeds) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.grayscale20),
        color: AppColors.grayscale00,
      ),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Scrollbar(
          child: ListView.builder(
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              final breed = breeds[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedBreed = breed;
                  });
                },
                child: SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Text(
                        breed,
                        style: AppFonts.body2(
                          color: AppColors.grayscale90,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedBreed == breed
                                ? AppColors.primary20
                                : AppColors.grayscale30,
                            width: selectedBreed == breed ? 6.0 : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
