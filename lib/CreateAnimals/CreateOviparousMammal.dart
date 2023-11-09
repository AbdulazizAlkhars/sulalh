import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';
import 'package:hathera_demo/Widgets/UploadFiles.dart';

import 'package:hathera_demo/Widgets/datetextfiled.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CreateOviCumMammal extends ConsumerStatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CreateOviCumMammal createState() => _CreateOviCumMammal();
}

class _CreateOviCumMammal extends ConsumerState<CreateOviCumMammal> {
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _medicalController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _frequencyEggsController =
      TextEditingController();
  final TextEditingController _numberofEggsController = TextEditingController();
  String fieldName = '';
  String fieldContent = '';
  String selectedOviSire = 'Add';
  String selectedOviDam = 'Add';
  // String selectedDate = '';
  String selectedBreedingStage = '';

  void dateOfBirth(String DateOfBirth) {
    setState(() {
      ref.read(dateOfBirthProvider.notifier).update((state) => DateOfBirth);
    });
  }

  Map<String, DateTime?> selectedMammalDates = {};
  List<String> selectedOviChips = [];
  List<Widget> customOviTextFields = [];
  Map<String, DateTime?> selectedOviDates = {};
  bool showAdditionalFields = false;
  String selectedOviDateType = "Date Of Birth"; // Default value
  // Initial text for the button
  String selectedOviGender = '';
  bool _addAnimalParents = false;
  bool _addOviChildren = false;
  // ignore: non_constant_identifier_names
  final ImagePicker _Animalpicker = ImagePicker();

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedAnimalImage =
                      await _Animalpicker.pickImage(source: ImageSource.camera);
                  if (pickedAnimalImage != null) {
                    ref
                        .read(selectedAnimalImageProvider.notifier)
                        .update((state) => File(pickedAnimalImage.path));
                    // setState(() {
                    //   _selectedOviImage = File(pickedAnimalImage.path);
                    // });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedAnimalImage = await _Animalpicker.pickImage(
                      source: ImageSource.gallery);
                  if (pickedAnimalImage != null) {
                    ref
                        .read(selectedAnimalImageProvider.notifier)
                        .update((state) => File(pickedAnimalImage.path));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAnimalSireSelectionSheet() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.5;

    TextEditingController searchController = TextEditingController();
    List<Map<String, String>> filteredanimalSires = List.from(animalSires);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: sheetHeight,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          filteredanimalSires = animalSires
                              .where((sire) => sire['name']!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Search Country",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredanimalSires.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: Text(filteredanimalSires[index]['name']!),
                          onTap: () {
                            final selectedSire =
                                filteredanimalSires[index]['name']!;
                            ref
                                .read(animalSireDetailsProvider.notifier)
                                .update((state) => selectedSire);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  final List<Map<String, String>> animalSires = [
    {'name': 'Alice'},
    {'name': 'John'},
    {'name': 'Jack'},
    {'name': 'Kiran'},
    {'name': 'Mantic'},
    {'name': 'Mongolia'},
    // Add more country codes and names as needed
  ];

  void _showAnimalDamSelectionSheet() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.5;

    TextEditingController searchController = TextEditingController();
    List<Map<String, String>> filteredAnimalDam = List.from(animalDams);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: sheetHeight,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          filteredAnimalDam = animalDams
                              .where((country) => country['name']!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Search Country",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredAnimalDam.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: Text(filteredAnimalDam[index]['name']!),
                          onTap: () {
                            final selectedDam =
                                filteredAnimalDam[index]['name']!;
                            ref
                                .read(animalDamDetailsProvider.notifier)
                                .update((state) => selectedDam);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  final List<Map<String, String>> animalDams = [
    {'name': 'Alice'},
    {'name': 'John'},
    {'name': 'Jack'},
    {'name': 'Kiran'},
    {'name': 'Mantic'},
    {'name': 'Mongolia'},
    // Add more country codes and names as needed
  ];

  void _showDateSelectionSheet(BuildContext context) async {
    final selectedAnimalType = ref.watch(selectedAnimalTypeProvider);
    List<String> OvidateTypes = [
      'Date Of Hatching',
      'Date Of Death',
      'Date Of Sale',
    ];
    List<String> MammaldateTypes = [
      'Date Of Weaning',
      'Date Of Mating',
      'Date Of Death',
      'Date Of Sale',
    ];

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Add Date ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (selectedAnimalType == "Oviparous")
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: OvidateTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(OvidateTypes[index]),
                            dense: true,
                            minVerticalPadding: double.minPositive,
                            trailing: const Icon(Icons.arrow_right_alt_rounded),
                            onTap: () {
                              Navigator.pop(context);
                              _showOviDatePicker(context, OvidateTypes[index]);
                            },
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              if (selectedAnimalType == "Mammal")
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: MammaldateTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(MammaldateTypes[index]),
                            dense: true,
                            minVerticalPadding: double.minPositive,
                            trailing: const Icon(Icons.arrow_right_alt_rounded),
                            onTap: () {
                              Navigator.pop(context);
                              _showOviDatePicker(
                                  context, MammaldateTypes[index]);
                            },
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showOviDatePicker(BuildContext context, String dateType) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedOviDates[dateType] ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      ref.read(selectedOviDatesProvider.notifier).state = {
        ...ref.read(selectedOviDatesProvider),
        dateType: selectedDate,
      };
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

    if (result != null) {
      setState(() {
        selectedOviChips = List<String>.from(result);
      });
    }
  }

  void _showOviFieldNameModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Custom Field',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  onChanged: (value) {
                    ref
                        .read(fieldNameProvider.notifier)
                        .update((state) => value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Field Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                ButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    _showOviFieldContentModal(context);
                  },
                  buttonText: 'Confirm',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 238, 238, 238),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showOviFieldContentModal(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Text Area',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter Field Content',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                  onChanged: (value) {
                    ref
                        .read(fieldContentProvider.notifier)
                        .update((state) => value);
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    _addNewOviTextField(context);
                  },
                  buttonText: 'Confirm',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 238, 238, 238),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addNewOviTextField(BuildContext context) {
    final fieldName = ref.read(fieldNameProvider);
    final fieldContent = ref.read(fieldContentProvider);

    ref.read(customOviTextFieldsProvider).add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(fieldName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                controller: TextEditingController(text: fieldContent),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
  }

  void _showMammalDateSelectionSheet(BuildContext context) async {
    List<String> MammaldateTypes = [
      'Date Of Weaning',
      'Date Of Mating',
      'Date Of Death',
      'Date Of Sale',
    ];

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Add Date ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: MammaldateTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(MammaldateTypes[index]),
                          dense: true,
                          minVerticalPadding: double.minPositive,
                          trailing: const Icon(Icons.arrow_right_alt_rounded),
                          onTap: () {
                            Navigator.pop(context);
                            _showMammalDatePicker(
                                context, MammaldateTypes[index]);
                          },
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMammalDatePicker(BuildContext context, String dateType) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedMammalDates[dateType] ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        selectedMammalDates[dateType] = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedAnimalType = ref.watch(selectedAnimalTypeProvider);
    final selectedAnimalImage = ref.watch(selectedAnimalImageProvider);
    final animalDam = ref.watch(animalDamDetailsProvider);
    final animalSire = ref.watch(animalSireDetailsProvider);

    final chips = ref.watch(selectedOviChipsProvider);
    final customFields = ref.watch(customOviTextFieldsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create '.tr,
              style: AppFonts.headline3(color: AppColors.grayscale90),
            ),
            Text(
              selectedAnimalType.tr,
              style: AppFonts.headline3(color: AppColors.grayscale90),
            ),
          ],
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: AppColors.grayscale10,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: AppColors.grayscale10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.close_rounded, color: Colors.black),
            ),
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.042,
              right: MediaQuery.of(context).size.width * 0.042),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.16,
                    backgroundColor: AppColors.grayscale10,
                    backgroundImage: selectedAnimalImage != null
                        ? FileImage(selectedAnimalImage)
                        : null,
                    child: selectedAnimalImage == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: AppColors.grayscale90,
                          )
                        : null,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    _showImagePicker(context);
                  },
                  child: Text(
                    'Add Photo'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primary40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  'Name'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              TextFormField(
                onChanged: (value) {
                  ref
                      .read(animalNameProvider.notifier)
                      .update((state) => value);
                },
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name'.tr, // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              Text(
                "Family Tree".tr,
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              Text(
                "Add Parents If They're In The System".tr,
                style: AppFonts.body2(color: AppColors.grayscale60),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Add Parents'.tr,
                        style: AppFonts.body2(color: AppColors.grayscale90),
                      ),
                    ),
                    Switch(
                      value: _addAnimalParents,
                      onChanged: (value) {
                        setState(() {
                          _addAnimalParents = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _addAnimalParents,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.005),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sire (Father)'.tr,
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              _showAnimalSireSelectionSheet();
                            },
                            child: Text(
                              animalSire,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 86, 38),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005),
                      Row(
                        children: [
                          Text(
                            'Dam (Mother)'.tr,
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              _showAnimalDamSelectionSheet();
                            },
                            child: Text(
                              animalDam,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 86, 38),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  children: [
                    Text(
                      'Add Children'.tr,
                      style: AppFonts.body2(color: AppColors.grayscale90),
                    ),
                    const Spacer(),
                    Switch(
                      value: _addOviChildren,
                      onChanged: (value) {
                        setState(() {
                          _addOviChildren = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _addOviChildren,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.005),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Children',
                            style: AppFonts.body2(color: AppColors.grayscale70),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              _showAnimalSireSelectionSheet();
                            },
                            child: Text(
                              animalSire,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 86, 38),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Animal Sex".tr,
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ref
                          .read(selectedOviGenderProvider.notifier)
                          .update((state) => 'Unknown'.tr);

                      showAdditionalFields = false;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Unknown'.tr,
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ref.read(selectedOviGenderProvider) ==
                                    'Unknown'.tr
                                ? AppColors.primary20
                                : AppColors.grayscale30,
                            width: ref.read(selectedOviGenderProvider) ==
                                    'Unknown'.tr
                                ? 6.0
                                : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ref
                          .read(selectedOviGenderProvider.notifier)
                          .update((state) => 'Male'.tr);
                      showAdditionalFields = false;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Male'.tr,
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                ref.read(selectedOviGenderProvider) == 'Male'.tr
                                    ? AppColors.primary20
                                    : AppColors.grayscale30,
                            width:
                                ref.read(selectedOviGenderProvider) == 'Male'.tr
                                    ? 6.0
                                    : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      ref
                          .read(selectedOviGenderProvider.notifier)
                          .update((state) => 'Female'.tr);
                      showAdditionalFields = true;
                      // Show additional fields when Female is selected
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Female'.tr,
                          style: AppFonts.body2(color: AppColors.grayscale90),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.064,
                        height: MediaQuery.of(context).size.width * 0.064,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ref.read(selectedOviGenderProvider) ==
                                    'Female'.tr
                                ? AppColors.primary20
                                : AppColors.grayscale30,
                            width: ref.read(selectedOviGenderProvider) ==
                                    'Female'.tr
                                ? 6.0
                                : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              if (showAdditionalFields) // Show additional fields when Female is selected
                Visibility(
                  visible: selectedAnimalType == 'Oviparous'.tr,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Frequency Of Laying Eggs/Month',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          ref
                              .read(layingFrequencyProvider.notifier)
                              .update((state) => value);
                        },
                        controller: _frequencyEggsController,
                        decoration: InputDecoration(
                          hintText:
                              'Enter Frequency', // Add your hint text here
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        textInputAction:
                            TextInputAction.done, // Change the keyboard action
                      ),
                      // Your first additional text field widget here
                      const SizedBox(height: 10),
                      const Text(
                        'Number Of Eggs/Month',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          ref
                              .read(eggsPerMonthProvider.notifier)
                              .update((state) => value);
                        },
                        controller: _numberofEggsController,
                        decoration: InputDecoration(
                          hintText:
                              'Enter The Number', // Add your hint text here
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        textInputAction:
                            TextInputAction.done, // Change the keyboard action
                      ),
                      const SizedBox(height: 15),
                      const Divider(),
                      // Your second additional text field widget here
                    ],
                  ),
                ),
              if (showAdditionalFields) // Show additional fields when Female is selected
                Visibility(
                  visible: selectedAnimalType == 'Mammal',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.019),
                      Text(
                        "Breeding Stage",
                        style: AppFonts.headline2(color: AppColors.grayscale90),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedBreedingStageProvider.notifier)
                                .update((state) => 'Ready For Breeding');
                            setState(() {
                              selectedBreedingStage = 'Ready For Breeding';
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Ready For Breeding',
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.064,
                                height:
                                    MediaQuery.of(context).size.width * 0.064,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ref.read(
                                                selectedBreedingStageProvider) ==
                                            'Ready For Breeding'
                                        ? AppColors.primary20
                                        : AppColors.grayscale30,
                                    width: ref.read(
                                                selectedBreedingStageProvider) ==
                                            'Ready For Breeding'
                                        ? 6.0
                                        : 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedBreedingStageProvider.notifier)
                                .update((state) => 'Pregnant');
                            setState(() {
                              selectedBreedingStage = 'Pregnant';
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Pregnant',
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.064,
                                height:
                                    MediaQuery.of(context).size.width * 0.064,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ref.read(
                                                selectedBreedingStageProvider) ==
                                            'Pregnant'
                                        ? AppColors.primary20
                                        : AppColors.grayscale30,
                                    width: ref.read(
                                                selectedBreedingStageProvider) ==
                                            'Pregnant'
                                        ? 6.0
                                        : 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedBreedingStageProvider.notifier)
                                .update((state) => 'Lactating');
                            setState(() {
                              selectedBreedingStage = 'Lactating';
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Lactating',
                                  style: AppFonts.body2(
                                      color: AppColors.grayscale90),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.064,
                                height:
                                    MediaQuery.of(context).size.width * 0.064,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ref.read(
                                                selectedBreedingStageProvider) ==
                                            'Lactating'
                                        ? AppColors.primary20
                                        : AppColors.grayscale30,
                                    width: ref.read(
                                                selectedBreedingStageProvider) ==
                                            'Lactating'
                                        ? 6.0
                                        : 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.019),
                      const Divider(),
                    ],
                  ),
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Dates".tr,
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              Text(
                "Date Of Birth".tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              DateTextField(
                onDateSelected: dateOfBirth,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.029),
              _buildOviDateFields(),
              TextButton(
                onPressed: () {
                  _showDateSelectionSheet(context);
                },
                child: Text(
                  'Add Date +'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Add Tag".tr,
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: chips.map((chip) {
                  return CustomTag(
                    label: chip,
                    selected: true, // Since these are selected chips
                    onTap: () {
                      setState(() {
                        chips.remove(chip); // To deselect the chip
                      });
                    },
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  _animalTagsModalSheet();
                },
                child: Text(
                  'Add Tags +'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                "Add Custom Fields".tr,
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Column(
                children: customFields,
              ),
              TextButton(
                onPressed: () {
                  _showOviFieldNameModal(context);
                },
                child: Text(
                  'Add Custom Field +'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.019),
              Text(
                'Additional Notes'.tr,
                style: AppFonts.headline2(color: AppColors.grayscale90),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                onChanged: (value) {
                  ref
                      .read(additionalnotesProvider.notifier)
                      .update((state) => value);
                },
                maxLines: 6, // Set the maximum number of lines
                controller: _notesController,
                decoration: InputDecoration(
                  hintText: 'Add Additional Information If Needed'
                      .tr, // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                height: 270,
                width: double.infinity,
                child: Focus(
                  onFocusChange: (hasFocus) {}, // Dummy onFocusChange callback
                  child: const FileUploaderField(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              // SizedBox(
              //   height: 20,
              // ),
              Text(
                'Medical Needs Notes'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (value) {
                  ref
                      .read(medicalNeedsProvider.notifier)
                      .update((state) => value);
                },
                maxLines: 6, // Set the maximum number of lines
                controller: _medicalController,
                decoration: InputDecoration(
                  hintText:
                      'Add Medical Notes If Needed', // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListOfAnimals(
                  shouldAddAnimal: true,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 36, 86, 38),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            'Save'.tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildOviDateFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ref
          .read(selectedOviDatesProvider.notifier)
          .state
          .keys
          .map((dateType) {
        final selectedDate =
            ref.read(selectedOviDatesProvider.notifier).state[dateType];
        if (selectedDate != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateType,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'DD:MM:YYYY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _showOviDatePicker(context, dateType);
                          },
                          child: const Icon(
                            Icons.calendar_today,
                            color: Color.fromARGB(255, 36, 86, 38),
                          ),
                        ),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                        text: DateFormat('dd-MM-yyyy').format(selectedDate),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        ref.read(selectedOviDatesProvider)[dateType] = null;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          );
        } else {
          return Container(); // Return an empty container if selectedDate is null
        }
      }).toList(),
    );
  }
}
