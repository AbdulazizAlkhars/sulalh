import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';
import 'package:image_picker/image_picker.dart';

class editAnimalGenInfo extends ConsumerWidget {
  final OviVariables oviDetails;

  editAnimalGenInfo({required this.oviDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController eventNumberController = TextEditingController();
    final TextEditingController medicalNeedsController =
        TextEditingController();
    final TextEditingController layingFrequencyController =
        TextEditingController();
    final TextEditingController eggsPerMonthController =
        TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();

    eventNumberController.text = oviDetails.eventNumber;
    medicalNeedsController.text = oviDetails.medicalNeeds;
    layingFrequencyController.text = oviDetails.layingFrequency;
    eggsPerMonthController.text = oviDetails.eggsPerMonth;
    dateOfBirthController.text = oviDetails.dateOfBirth;
    imageUrlController.text = oviDetails.selectedOviImage?.path ?? '';

    Future<void> _pickImage(ImageSource source) async {
      final pickedFile = await ImagePicker().getImage(source: source);

      if (pickedFile != null) {
        imageUrlController.text = pickedFile.path;
      }
    }

    void _animalTagsModalSheet() async {
      final result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Current State',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Current State',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            CustomTag(
                              label: 'Borrowed',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Borrowed'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Borrowed')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Borrowed');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Borrowed');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Adopted',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Adopted'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Adopted')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Adopted');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Adopted');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Donated',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Donated'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Donated')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Donated');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Donated');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Escaped',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Escaped'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Escaped')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Escaped');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Escaped');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Stolen',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Stolen'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Stolen')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Stolen');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Stolen');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Trasnferred',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Trasnferred'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Trasnferred')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Trasnferred');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Trasnferred');
                                  }
                                });
                              },
                            ),

                            // Add more chips here
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Medical State',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            CustomTag(
                              label: 'Injured',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Injured'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Injured')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Injured');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Injured');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Sick',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Sick'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Sick')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Sick');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Sick');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Quarantined',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Quarantined'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Quarantined')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Quarantined');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Quarantined');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Medication',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Medication'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Medication')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Medication');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Medication');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Testing',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Testing'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Testing')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Testing');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Testing');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Pregnant',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Pregnant'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Pregnant')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Pregnant');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Pregnant');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Lactating',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Lactating'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Lactating')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Lactating');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Lactating');
                                  }
                                });
                              },
                            ),

                            // Add more chips here
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Other',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            CustomTag(
                              label: 'Sold',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Sold'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Sold')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Sold');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Sold');
                                  }
                                });
                              },
                            ),
                            CustomTag(
                              label: 'Dead',
                              selected: ref
                                  .read(selectedOviChipsProvider)
                                  .contains('Dead'),
                              onTap: () {
                                setState(() {
                                  if (ref
                                      .read(selectedOviChipsProvider)
                                      .contains('Dead')) {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .remove('Dead');
                                  } else {
                                    ref
                                        .read(selectedOviChipsProvider)
                                        .add('Dead');
                                  }
                                });
                              },
                            ),
                            // Add more chips here
                          ],
                        ),
                        const SizedBox(height: 40.0),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle the button press here
                                  Navigator.of(context).pop(ref.read(
                                      selectedOviChipsProvider)); // Close the modal
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                      255, 36, 86, 38), // Button color
                                  foregroundColor: Colors.white, // Text color
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Text('Save'), // Button text
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );

// Inside _animalTagsModalSheet:
      if (result != null) {}
    }

    final chips = ref.watch(selectedOviChipsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Event Number'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[100],
                backgroundImage: oviDetails.selectedOviImage != null
                    ? FileImage(oviDetails.selectedOviImage!)
                    : null,
                child: oviDetails.selectedOviImage == null
                    ? Icon(
                        Icons.camera_alt_outlined,
                        size: 50,
                        color: Colors.grey,
                      )
                    : null,
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Text('Select Image from Gallery'),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
                child: Text('Capture Image from Camera'),
              ),
              TextField(
                controller: eventNumberController,
                decoration: InputDecoration(labelText: 'New Event Number'),
              ),
              TextField(
                controller: medicalNeedsController,
                decoration: InputDecoration(labelText: 'Medical Needs'),
              ),
              TextField(
                controller: layingFrequencyController,
                decoration: InputDecoration(labelText: 'Laying Frequency'),
              ),
              TextField(
                controller: eggsPerMonthController,
                decoration: InputDecoration(labelText: 'Eggs Per Month'),
              ),
              TextField(
                controller: dateOfBirthController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: chips.map((chip) {
                  return CustomTag(
                    label: chip,
                    selected: true, // Since these are selected chips
                    onTap: () {},
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  _animalTagsModalSheet();
                },
                child: const Text(
                  'Add Tags +',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final updatedOviDetails = oviDetails.copyWith(
                    eventNumber: eventNumberController.text,
                    medicalNeeds: medicalNeedsController.text,
                    layingFrequency: layingFrequencyController.text,
                    eggsPerMonth: eggsPerMonthController.text,
                    dateOfBirth: dateOfBirthController.text,
                    selectedOviImage: File(imageUrlController.text),
                  );

                  final oviAnimals = ref.read(ovianimalsProvider);
                  final index = oviAnimals.indexOf(oviDetails);
                  if (index >= 0) {
                    oviAnimals[index] = updatedOviDetails;
                  }

                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
