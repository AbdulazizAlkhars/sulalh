import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/Tags.dart';

// ignore: must_be_immutable
class AnimalFilters extends StatefulWidget {
  final String fieldName;
  final String fieldContent;
  final TextEditingController notesController;
  final String selectedOviSire;
  final String selectedDate;
  final String selectedOviDam;
  TextEditingController nameController;
  TextEditingController frequencyEggsController;
  TextEditingController numberofEggsController;
  // final DateTime? selectedOviDate;
  final List<String> selectedOviChips;
  final Map<String, DateTime?> selectedOviDates;
  final bool showAdditionalFields;
  final String selectedOviDateType;
  final String selectedOviGender;
  final bool addOviParents;
  final bool addOviChildren;
  final File? selectedOviImage;
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;
  AnimalFilters({
    super.key,
    required this.fieldName,
    required this.fieldContent,
    required this.notesController,
    required this.selectedOviSire,
    required this.selectedOviDam,
    // required this.selectedOviDate,
    required this.selectedOviChips,
    required this.selectedOviDates,
    required this.showAdditionalFields,
    required this.selectedOviDateType,
    required this.selectedOviGender,
    required this.addOviParents,
    required this.addOviChildren,
    required this.selectedOviImage,
    required this.nameController,
    required this.selectedDate,
    required this.frequencyEggsController,
    required this.numberofEggsController,
    required this.selectedAnimalType,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalBreed,
    required selectedOviDate,
  });

  @override
  _AnimalFilters createState() => _AnimalFilters();
}

class _AnimalFilters extends State<AnimalFilters> {
  Map<String, List<String>> sectionItems = {
    'Animal Type': ['Mammal', 'Oviparous'],
    'Animal Species': ['Sheep', 'Cow', 'Horse'],
    'Animal Breed': ['Altafai stoat', 'East Siberian stoat', 'Gobi stoat'],
    'Animal Sex': ['Male', 'Female'],
    'Breeding Stage': ['Ready for breeding', 'Pregnant', 'Lactating'],
    'Tags': ['Borrowed', 'Adopted', 'Donated'],
  };

  Map<String, String?> selectedAnimals = {};

  @override
  void initState() {
    super.initState();
    for (var heading in sectionItems.keys) {
      selectedAnimals[heading] = null;
    }
  }

  void _showDialog(BuildContext context, String sectionHeading) {
    if (sectionHeading == 'Tags') {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            child: FractionallySizedBox(
              heightFactor: 0.62,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Tags',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Current State',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Tags(
                              text: 'Borrowed',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.active,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Adopted',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.notActive,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Donated',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.disabled,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Tags(
                              text: 'Escaped',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.active,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Stolen',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.notActive,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Transferred',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.disabled,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Medical State',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Tags(
                              text: 'Injured',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.active,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Sick',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.notActive,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Quarantined',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.disabled,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Tags(
                              text: 'Medication',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.active,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Testing',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.notActive,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Others',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 42, 41, 41),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Tags(
                              text: 'Sold',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.active,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Tags(
                              text: 'Dead',
                              icon: Icons.ac_unit,
                              onPress: () {
                                // Handle tag click
                              },
                              status: TagStatus.notActive,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 225, 225, 225),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: () {
                                // Handle cancel button press
                                Navigator.pop(context); // Close the modal sheet
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text('Clear All',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 86, 38),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: () {
                                // Handle join farm button press
                                Navigator.pop(context); // Close the modal sheet
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'Apply',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Show More"),
            content: const Text("You tapped the 'Show more >' button."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Animals'),
        actions: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   selectedAnimals.clear();
              //   for (var heading in sectionItems.keys) {
              //     selectedAnimals[heading] = null;
              //   }
              // });
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (var sectionIndex = 0;
              sectionIndex < sectionItems.length;
              sectionIndex++)
            _buildSection(sectionIndex),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ButtonWidget(
          onPressed: () {
            List<String> selectedFiltersList = [];
            selectedAnimals.forEach((key, value) {
              if (value != null) {
                selectedFiltersList.add(value);
              }
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListOfAnimals(
                  selectedFilters: selectedFiltersList,
                  fieldName: widget.fieldName,
                  fieldContent: widget.fieldContent,
                  notesController: widget.notesController,
                  selectedOviSire: widget.selectedOviSire,
                  selectedOviDam: widget.selectedOviDam,
                  selectedOviChips: widget.selectedOviChips,
                  selectedOviDates: widget.selectedOviDates,
                  showAdditionalFields: widget.showAdditionalFields,
                  selectedOviDateType: widget.selectedOviDateType,
                  selectedOviGender: widget.selectedOviGender,
                  addOviParents: widget.addOviParents,
                  addOviChildren: widget.addOviChildren,
                  selectedOviImage: widget.selectedOviImage,
                  nameController: widget.nameController,
                  selectedDate: widget.selectedDate,
                  frequencyEggsController: widget.frequencyEggsController,
                  numberofEggsController: widget.numberofEggsController,
                  selectedAnimalType: widget.selectedAnimalType,
                  selectedAnimalSpecies: widget.selectedAnimalSpecies,
                  selectedAnimalBreed: widget.selectedAnimalBreed,
                  shouldAddAnimal: false,
                ),
              ),
            );
          },
          buttonText: 'Continue',
        ),
      ),
    );
  }

  Widget _buildSection(int sectionIndex) {
    String sectionHeading = sectionItems.keys.elementAt(sectionIndex);
    List<String> sectionLanguages = sectionItems[sectionHeading]!;
    String? selectedLanguage = selectedAnimals[sectionHeading];

    bool showShowMoreButton =
        sectionHeading != 'Animal Type' && sectionHeading != 'Animal Sex';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionHeading,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (var index = 0;
                index <
                    (showShowMoreButton
                        ? sectionLanguages.length + 1
                        : sectionLanguages.length);
                index++)
              if (showShowMoreButton && index == sectionLanguages.length)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _showDialog(
                          context, sectionHeading); // Show dialog on tap
                    },
                    child: const Text(
                      'Show more >',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 36, 86, 38),
                      ),
                    ),
                  ),
                )
              else
                _buildListItem(
                    sectionHeading, sectionLanguages[index], selectedLanguage),
          ],
        ),
      ],
    );
  }

  Widget _buildListItem(
      String sectionHeading, String language, String? selectedLanguage) {
    bool isSelected = language == selectedLanguage;
    bool isMaleSelected = selectedAnimals['Animal Sex'] == 'Male';
    bool isBreedingStage = sectionHeading == 'Breeding Stage';
    bool isPregnantOrLactating =
        language == 'Pregnant' || language == 'Lactating';

    if (isMaleSelected && isBreedingStage && isPregnantOrLactating) {
      isSelected = false;
    }

    Color borderColor = isSelected ? Colors.green : Colors.grey;
    Color trailingColor = isPregnantOrLactating && isMaleSelected
        ? const Color.fromARGB(117, 158, 158, 158)
        : Colors.transparent;
    Color textColor =
        isPregnantOrLactating && isMaleSelected ? Colors.grey : Colors.black;

    return ListTile(
      title: Text(
        language,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
        ),
      ),
      trailing: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: isSelected ? 6.0 : 2.0,
          ),
          color: trailingColor,
        ),
      ),
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedAnimals[sectionHeading] = null;
          } else {
            selectedAnimals[sectionHeading] = language;
          }
        });
      },
    );
  }
}
