import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/MammalGeneralInfo.dart';

import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';

import 'package:hathera_demo/Widgets/datetextfiled.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CreateMammalPage extends StatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  const CreateMammalPage(
      {super.key,
      required this.selectedAnimalType,
      required this.selectedAnimalSpecies,
      required this.selectedAnimalBreed});

  @override
  // ignore: library_private_types_in_public_api
  _CreateMammalPage createState() => _CreateMammalPage();
}

class _CreateMammalPage extends State<CreateMammalPage> {
  final TextEditingController _mammalnotesController = TextEditingController();
  final TextEditingController _mammalnameController = TextEditingController();
  final TextEditingController _frequencyEggsController =
      TextEditingController();
  final TextEditingController _numberofEggsController = TextEditingController();
  String mammalfieldName = '';
  String mammalfieldContent = '';
  String selectedMammalSire = 'Add';
  String selectedMammalDam = 'Add';
  String selectedMammalDate = '';

  void setSelectedDate(String date) {
    setState(() {
      selectedMammalDate = date;
    });
  }

  List<String> selectedMammalChips = [];
  List<Widget> customMammalTextFields = [];
  Map<String, DateTime?> selectedMammalDates = {};
  bool showMammalAdditionalFields = false;
  String selectedMammalDateType = "Date Of Birth"; // Default value
  // Initial text for the button
  String selectedMammalGender = '';
  bool _addMammalParents = false;
  bool _addMammalChildren = false;
  // ignore: non_constant_identifier_names
  final ImagePicker _Mammalpicker = ImagePicker();
  File? _selectedMammalImage;

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
                  final pickedMammalImage =
                      await _Mammalpicker.pickImage(source: ImageSource.camera);
                  if (pickedMammalImage != null) {
                    setState(() {
                      _selectedMammalImage = File(pickedMammalImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedMammalImage = await _Mammalpicker.pickImage(
                      source: ImageSource.gallery);
                  if (pickedMammalImage != null) {
                    setState(() {
                      _selectedMammalImage = File(pickedMammalImage.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMammalSireSelectionSheet(BuildContext context) async {
    final String? newMammalSire = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> MammalSireDetails = [
          {'name': 'Alice', 'nickname': 'Cow'},
          {'name': 'Bob', 'nickname': 'Sheep'},
          {'name': 'Charlie', 'nickname': 'Horse'},
          {'name': 'David', 'nickname': 'Ox'},
          {'name': 'Emily', 'nickname': 'Rabbit'},
        ];
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.75, // 75% of screen height
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Add Father",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  MammalSireDetails = [
                                    {'name': 'Alice', 'nickname': 'Cow'},
                                    {'name': 'Bob', 'nickname': 'Sheep'},
                                    {'name': 'Charlie', 'nickname': 'Horse'},
                                    {'name': 'David', 'nickname': 'Ox'},
                                    {'name': 'Emily', 'nickname': 'Rabbit'},
                                  ]
                                      .where((entry) =>
                                          entry['name']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) ||
                                          entry['nickname']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Search By Name Or ID",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: MammalSireDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(MammalSireDetails[index]['name']![0]),
                            ),
                            title: Text(MammalSireDetails[index]['name']!),
                            subtitle:
                                Text(MammalSireDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, MammalSireDetails[index]['name']);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    if (newMammalSire != null) {
      setState(() {
        selectedMammalSire = newMammalSire;
      });
    }
  }

  void _showMammalDamSelectionSheet(BuildContext context) async {
    final String? newMammalDam = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> MammalDamDetails = [
          {'name': 'Mantis', 'nickname': 'Alein'},
          {'name': 'Nebula', 'nickname': 'Robot'},
          {'name': 'Rocket', 'nickname': 'Racoon'},
          {'name': 'Groot', 'nickname': 'Tree'},
          {'name': 'Peter', 'nickname': 'Human'},
        ];

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.75, // 75% of screen height
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Add Mother",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  MammalDamDetails = [
                                    {'name': 'Mantis', 'nickname': 'Alein'},
                                    {'name': 'Nebula', 'nickname': 'Robot'},
                                    {'name': 'Rocket', 'nickname': 'Racoon'},
                                    {'name': 'Groot', 'nickname': 'Tree'},
                                    {'name': 'Peter', 'nickname': 'Human'},
                                  ]
                                      .where((entry) =>
                                          entry['name']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) ||
                                          entry['nickname']!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Search By Name Or ID",
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: MammalDamDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(MammalDamDetails[index]['name']![0]),
                            ),
                            title: Text(MammalDamDetails[index]['name']!),
                            subtitle:
                                Text(MammalDamDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, MammalDamDetails[index]['name']);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (newMammalDam != null) {
      setState(() {
        selectedMammalDam = newMammalDam;
      });
    }
  }

  void _showMammalDateSelectionSheet(BuildContext context) async {
    List<String> MammaldateTypes = [
      'Date Of Hatching',
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

  void _openMammalModalSheet() async {
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
                            selected: selectedMammalChips.contains('Borrowed'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Borrowed')) {
                                  selectedMammalChips.remove('Borrowed');
                                } else {
                                  selectedMammalChips.add('Borrowed');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Adopted',
                            selected: selectedMammalChips.contains('Adopted'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Adopted')) {
                                  selectedMammalChips.remove('Adopted');
                                } else {
                                  selectedMammalChips.add('Adopted');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Donated',
                            selected: selectedMammalChips.contains('Donated'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Donated')) {
                                  selectedMammalChips.remove('Donated');
                                } else {
                                  selectedMammalChips.add('Donated');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Escaped',
                            selected: selectedMammalChips.contains('Escaped'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Escaped')) {
                                  selectedMammalChips.remove('Escaped');
                                } else {
                                  selectedMammalChips.add('Escaped');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Stolen',
                            selected: selectedMammalChips.contains('Stolen'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Stolen')) {
                                  selectedMammalChips.remove('Stolen');
                                } else {
                                  selectedMammalChips.add('Stolen');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Trasnferred',
                            selected:
                                selectedMammalChips.contains('Trasnferred'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips
                                    .contains('Trasnferred')) {
                                  selectedMammalChips.remove('Trasnferred');
                                } else {
                                  selectedMammalChips.add('Trasnferred');
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
                            selected: selectedMammalChips.contains('Injured'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Injured')) {
                                  selectedMammalChips.remove('Injured');
                                } else {
                                  selectedMammalChips.add('Injured');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Sick',
                            selected: selectedMammalChips.contains('Sick'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Sick')) {
                                  selectedMammalChips.remove('Sick');
                                } else {
                                  selectedMammalChips.add('Sick');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Quarantined',
                            selected:
                                selectedMammalChips.contains('Quarantined'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips
                                    .contains('Quarantined')) {
                                  selectedMammalChips.remove('Quarantined');
                                } else {
                                  selectedMammalChips.add('Quarantined');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Medication',
                            selected:
                                selectedMammalChips.contains('Medication'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips
                                    .contains('Medication')) {
                                  selectedMammalChips.remove('Medication');
                                } else {
                                  selectedMammalChips.add('Medication');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Testing',
                            selected: selectedMammalChips.contains('Testing'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Testing')) {
                                  selectedMammalChips.remove('Testing');
                                } else {
                                  selectedMammalChips.add('Testing');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Pregnant',
                            selected: selectedMammalChips.contains('Pregnant'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Pregnant')) {
                                  selectedMammalChips.remove('Pregnant');
                                } else {
                                  selectedMammalChips.add('Pregnant');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Lactating',
                            selected: selectedMammalChips.contains('Lactating'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Lactating')) {
                                  selectedMammalChips.remove('Lactating');
                                } else {
                                  selectedMammalChips.add('Lactating');
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
                            selected: selectedMammalChips.contains('Sold'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Sold')) {
                                  selectedMammalChips.remove('Sold');
                                } else {
                                  selectedMammalChips.add('Sold');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Dead',
                            selected: selectedMammalChips.contains('Dead'),
                            onTap: () {
                              setState(() {
                                if (selectedMammalChips.contains('Dead')) {
                                  selectedMammalChips.remove('Dead');
                                } else {
                                  selectedMammalChips.add('Dead');
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
                                Navigator.of(context).pop(
                                    selectedMammalChips); // Close the modal
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
        selectedMammalChips = List<String>.from(result);
      });
    }
  }

  void _showMammalFieldNameModal(BuildContext context) {
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
                    setState(() {
                      mammalfieldName = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText:
                        'Enter Field Name', // Change to your desired placeholder
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
                  controller:
                      TextEditingController(), // You can initialize with default text if needed
                ),
                const SizedBox(
                  height: 35,
                ),
                ButtonWidget(
                  onPressed: () {
                    Navigator.pop(context); // Close the modal
                    _showMammalFieldContentModal(context, mammalfieldName);
                    // Add your continue button logic here
                  },
                  buttonText: 'Confirm',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 238, 238, 238), // Button color
                        foregroundColor: Colors.black, // Text color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text('Cancel'), // Button text
                    ),
                  ),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMammalFieldContentModal(
      BuildContext context, String mammalfieldName) {
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
                    labelText:
                        'Enter Field Content', // Change to your desired placeholder
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
                    mammalfieldContent = value;
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ButtonWidget(
                  onPressed: () {
                    Navigator.pop(context); // Close the modal
                    _addNewMammalTextField(mammalfieldName, mammalfieldContent);
                    // Add your continue button logic here
                  },
                  buttonText: 'Confirm',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the button press here
                        Navigator.pop(context); // Close the modal
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 238, 238, 238), // Button color
                        foregroundColor: Colors.black, // Text color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text('Cancel'), // Button text
                    ),
                  ),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addNewMammalTextField(String name, String content) {
    setState(() {
      customMammalTextFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
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
              controller: TextEditingController(text: content),
            ),
            const SizedBox(height: 15), // Add spacing between fields
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Mammal'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
            // Add your code here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
                // Handle back button press
                // Add your code here
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Center(
                child: GestureDetector(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: _selectedMammalImage != null
                        ? FileImage(_selectedMammalImage!)
                        : null,
                    child: _selectedMammalImage == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                            color: Colors.grey,
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
                  child: const Text(
                    'Add Photo',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 36, 86, 38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                "Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _mammalnameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name', // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
              const SizedBox(height: 20),
              const Text(
                "Family Tree",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Add Parents If They're In The System",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Add Parents',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Switch(
                    value: _addMammalParents,
                    onChanged: (value) {
                      setState(() {
                        _addMammalParents = value;
                      });
                    },
                  ),
                ],
              ),
              Visibility(
                visible: _addMammalParents,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 4,
                          child: Text(
                            'Sire (Father)',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: TextButton(
                            onPressed: () {
                              _showMammalSireSelectionSheet(context);
                            },
                            child: Text(
                              selectedMammalSire,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 86, 38),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Expanded(
                          flex: 4,
                          child: Text(
                            'Dam (Mother)',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: TextButton(
                            onPressed: () {
                              _showMammalDamSelectionSheet(context);
                            },
                            child: Text(
                              selectedMammalDam,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 86, 38),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Add Children',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Switch(
                    value: _addMammalChildren,
                    onChanged: (value) {
                      setState(() {
                        _addMammalChildren = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "Animal Sex",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMammalGender = 'Unknown';
                    showMammalAdditionalFields = false;
                  });
                },
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Unknown',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedMammalGender == 'Unknown'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedMammalGender == 'Unknown' ? 6.0 : 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMammalGender = 'Male';
                    showMammalAdditionalFields = false;
                  });
                },
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedMammalGender == 'Male'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedMammalGender == 'Male' ? 6.0 : 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMammalGender = 'Female';
                    showMammalAdditionalFields =
                        true; // Show additional fields when Female is selected
                  });
                },
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedMammalGender == 'Female'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedMammalGender == 'Female' ? 6.0 : 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              if (showMammalAdditionalFields) // Show additional fields when Female is selected
                Column(
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
                      controller: _frequencyEggsController,
                      decoration: InputDecoration(
                        hintText: 'Enter Frequency', // Add your hint text here
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
                      controller: _numberofEggsController,
                      decoration: InputDecoration(
                        hintText: 'Enter The Number', // Add your hint text here
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
              const SizedBox(height: 10),
              const Text(
                "Dates",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Date Of Birth",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DateTextField(
                onDateSelected: setSelectedDate,
              ),
              _buildMammalDateFields(),
              TextButton(
                onPressed: () {
                  _showMammalDateSelectionSheet(context);
                },
                child: const Text(
                  'Add Date +',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "Add Tag",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selectedMammalChips.map((chip) {
                  return CustomTag(
                    label: chip,
                    selected: true, // Since these are selected chips
                    onTap: () {
                      setState(() {
                        selectedMammalChips
                            .remove(chip); // To deselect the chip
                      });
                    },
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  _openMammalModalSheet();
                },
                child: const Text(
                  'Add Tags +',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "Add Custom Fields",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: customMammalTextFields,
              ),
              TextButton(
                onPressed: () {
                  _showMammalFieldNameModal(context);
                },
                child: const Text(
                  'Add Custom Field +',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 36, 86, 38),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "Additional Notes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 6, // Set the maximum number of lines
                controller: _mammalnotesController,
                decoration: InputDecoration(
                  hintText:
                      'Add Additional Information If Needed', // Add your hint text here
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
                textInputAction:
                    TextInputAction.done, // Change the keyboard action
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  // Add your logic to open the file manager and select files here
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  dashPattern: const [7, 7],
                  strokeWidth: 1,
                  color: Colors.grey,
                  child: SizedBox(
                    width: double.infinity, // Set the width of the container
                    height: 150, // Set the height of the container
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.file_open_outlined,
                            size: 35,
                          ),
                          onPressed: () {
                            // Handle back button press
                            // Add your code here
                          },
                        ),
                        const Text(
                          'Upload File, PDF, Jpeg, PNG',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MammalGenInfo(
                  mammalfieldName: mammalfieldName,
                  mammalfieldContent: mammalfieldContent,
                  numberofEggsController: _numberofEggsController,
                  frequencyEggsController: _frequencyEggsController,
                  mammalnameController: _mammalnameController,
                  mammalnotesController: _mammalnotesController,
                  selectedMammalSire: selectedMammalSire,
                  selectedMammalDate: selectedMammalDate,
                  selectedMammalDam: selectedMammalDam,
                  selectedMammalChips: selectedMammalChips,
                  selectedMammalDates: selectedMammalDates,
                  showMammalAdditionalFields: showMammalAdditionalFields,
                  selectedMammalDateType: selectedMammalDateType,
                  selectedMammalGender: selectedMammalGender,
                  addMammalParents: _addMammalParents,
                  addMammalChildren: _addMammalChildren,
                  selectedMammalImage: _selectedMammalImage,
                  selectedAnimalType: widget.selectedAnimalType,
                  selectedAnimalSpecies: widget.selectedAnimalSpecies,
                  selectedAnimalBreed: widget.selectedAnimalBreed,
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
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildMammalDateFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: selectedMammalDates.keys.map((dateType) {
        final selectedDate = selectedMammalDates[dateType];
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
                            _showMammalDatePicker(context, dateType);
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
                        selectedMammalDates[dateType] = null;
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







// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hathera_demo/Widgets/Button.dart';
// import 'package:hathera_demo/Widgets/TagChips.dart';
// import 'package:hathera_demo/Widgets/Textformfield.dart';
// import 'package:hathera_demo/Widgets/datetextfiled.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// // ignore: depend_on_referenced_packages
// import 'package:intl/intl.dart';

// class CreateMammalPage extends StatefulWidget {
//   final String selectedAnimalType;
//   final String selectedAnimalSpecies;
//   final String selectedAnimalBreed;
//   const CreateMammalPage(
//       {required this.selectedAnimalType,
//       required this.selectedAnimalSpecies,
//       required this.selectedAnimalBreed});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CreateMammalPage createState() => _CreateMammalPage();
// }

// class _CreateMammalPage extends State<CreateMammalPage> {
//   final TextEditingController _notesController = TextEditingController();
//   String selectedMammalSire = 'Add';
//   String selectedMammalDam = 'Add';
//   DateTime? selectedMammalDate;
//   String selectedDate = '';

//   void setSelectedDate(String date) {
//     setState(() {
//       selectedDate = date;
//     });
//   }

//   List<String> selectedMammalChips = [];
//   List<Widget> customMammalTextFields = [];
//   Map<String, DateTime?> selectedMammalDates = {};
//   String selectedDateType = "Date Of Birth"; // Default value
//   // Initial text for the button
//   String selectedMammalGender = '';
//   bool _addMammalParents = false;
//   bool _addMammalChildren = false;
//   final ImagePicker _Mammalpicker = ImagePicker();
//   File? _selectedMammalImage;

//   void _showImagePicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 150,
//           child: Column(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera),
//                 title: const Text('Camera'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   final pickedMammalImage =
//                       await _Mammalpicker.pickImage(source: ImageSource.camera);
//                   if (pickedMammalImage != null) {
//                     setState(() {
//                       _selectedMammalImage = File(pickedMammalImage.path);
//                     });
//                   }
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Gallery'),
//                 onTap: () async {
//                   Navigator.pop(context);
//                   final pickedMammalImage = await _Mammalpicker.pickImage(
//                       source: ImageSource.gallery);
//                   if (pickedMammalImage != null) {
//                     setState(() {
//                       _selectedMammalImage = File(pickedMammalImage.path);
//                     });
//                   }
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showSireSelectionSheet(BuildContext context) async {
//     final String? newSire = await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         // ignore: non_constant_identifier_names
//         List<Map<String, String>> MammalSireDetails = [
//           {'name': 'Alice', 'nickname': 'Cow'},
//           {'name': 'Bob', 'nickname': 'Sheep'},
//           {'name': 'Charlie', 'nickname': 'Horse'},
//           {'name': 'David', 'nickname': 'Ox'},
//           {'name': 'Emily', 'nickname': 'Rabbit'},
//         ];
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Container(
//                 height: MediaQuery.of(context).size.height *
//                     0.75, // 75% of screen height
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const Text(
//                       "Add Father",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50.0),
//                               border: Border.all(),
//                             ),
//                             child: TextField(
//                               onChanged: (value) {
//                                 setState(() {
//                                   MammalSireDetails = [
//                                     {'name': 'Alice', 'nickname': 'Cow'},
//                                     {'name': 'Bob', 'nickname': 'Sheep'},
//                                     {'name': 'Charlie', 'nickname': 'Horse'},
//                                     {'name': 'David', 'nickname': 'Ox'},
//                                     {'name': 'Emily', 'nickname': 'Rabbit'},
//                                   ]
//                                       .where((entry) =>
//                                           entry['name']!
//                                               .toLowerCase()
//                                               .contains(value.toLowerCase()) ||
//                                           entry['nickname']!
//                                               .toLowerCase()
//                                               .contains(value.toLowerCase()))
//                                       .toList();
//                                 });
//                               },
//                               decoration: const InputDecoration(
//                                 hintText: "Search By Name Or ID",
//                                 prefixIcon: Icon(Icons.search),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: MammalSireDetails.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListTile(
//                             leading: CircleAvatar(
//                               child: Text(MammalSireDetails[index]['name']![0]),
//                             ),
//                             title: Text(MammalSireDetails[index]['name']!),
//                             subtitle:
//                                 Text(MammalSireDetails[index]['nickname']!),
//                             onTap: () {
//                               Navigator.pop(
//                                   context, MammalSireDetails[index]['name']);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//     if (newSire != null) {
//       setState(() {
//         selectedMammalSire = newSire;
//       });
//     }
//   }

//   void _showDamSelectionSheet(BuildContext context) async {
//     final String? newDam = await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         // ignore: non_constant_identifier_names
//         List<Map<String, String>> MammalDamDetails = [
//           {'name': 'Mantis', 'nickname': 'Alein'},
//           {'name': 'Nebula', 'nickname': 'Robot'},
//           {'name': 'Rocket', 'nickname': 'Racoon'},
//           {'name': 'Groot', 'nickname': 'Tree'},
//           {'name': 'Peter', 'nickname': 'Human'},
//         ];

//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Container(
//                 height: MediaQuery.of(context).size.height *
//                     0.75, // 75% of screen height
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const Text(
//                       "Add Mother",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50.0),
//                               border: Border.all(),
//                             ),
//                             child: TextField(
//                               onChanged: (value) {
//                                 setState(() {
//                                   MammalDamDetails = [
//                                     {'name': 'Mantis', 'nickname': 'Alein'},
//                                     {'name': 'Nebula', 'nickname': 'Robot'},
//                                     {'name': 'Rocket', 'nickname': 'Racoon'},
//                                     {'name': 'Groot', 'nickname': 'Tree'},
//                                     {'name': 'Peter', 'nickname': 'Human'},
//                                   ]
//                                       .where((entry) =>
//                                           entry['name']!
//                                               .toLowerCase()
//                                               .contains(value.toLowerCase()) ||
//                                           entry['nickname']!
//                                               .toLowerCase()
//                                               .contains(value.toLowerCase()))
//                                       .toList();
//                                 });
//                               },
//                               decoration: const InputDecoration(
//                                 hintText: "Search By Name Or ID",
//                                 prefixIcon: Icon(Icons.search),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: MammalDamDetails.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListTile(
//                             leading: CircleAvatar(
//                               child: Text(MammalDamDetails[index]['name']![0]),
//                             ),
//                             title: Text(MammalDamDetails[index]['name']!),
//                             subtitle:
//                                 Text(MammalDamDetails[index]['nickname']!),
//                             onTap: () {
//                               Navigator.pop(
//                                   context, MammalDamDetails[index]['name']);
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );

//     if (newDam != null) {
//       setState(() {
//         selectedMammalDam = newDam;
//       });
//     }
//   }

//   void _showDateSelectionSheet(BuildContext context) async {
//     List<String> MammaldateTypes = [
//       'Date Of Weaning',
//       'Date Of Mating',
//       'Date Of Death',
//       'Date Of Sale',
//     ];

//     await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: MediaQuery.of(context).size.height * 0.40,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   'Add Date ',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: MammaldateTypes.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       children: [
//                         ListTile(
//                           title: Text(MammaldateTypes[index]),
//                           dense: true,
//                           minVerticalPadding: double.minPositive,
//                           trailing: const Icon(Icons.arrow_right_alt_rounded),
//                           onTap: () {
//                             Navigator.pop(context);
//                             _showMammalDatePicker(
//                                 context, MammaldateTypes[index]);
//                           },
//                         ),
//                         const Divider(),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showMammalDatePicker(BuildContext context, String dateType) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext builder) {
//         return SizedBox(
//           height: 200,
//           child: CupertinoDatePicker(
//             initialDateTime: DateTime.now(),
//             minimumYear: 2000,
//             maximumYear: DateTime.now().year,
//             mode: CupertinoDatePickerMode.date,
//             onDateTimeChanged: (DateTime pickedDate) {
//               setState(() {
//                 selectedMammalDates[dateType] = pickedDate;
//               });
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _openModalSheet() async {
//     final result = await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       showDragHandle: true,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height * 0.65,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         'Current State',
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 25),
//                       const Text(
//                         'Current State',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8.0,
//                         runSpacing: 8.0,
//                         children: [
//                           CustomTag(
//                             label: 'Borrowed',
//                             selected: selectedMammalChips.contains('Borrowed'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Borrowed')) {
//                                   selectedMammalChips.remove('Borrowed');
//                                 } else {
//                                   selectedMammalChips.add('Borrowed');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Adopted',
//                             selected: selectedMammalChips.contains('Adopted'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Adopted')) {
//                                   selectedMammalChips.remove('Adopted');
//                                 } else {
//                                   selectedMammalChips.add('Adopted');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Donated',
//                             selected: selectedMammalChips.contains('Donated'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Donated')) {
//                                   selectedMammalChips.remove('Donated');
//                                 } else {
//                                   selectedMammalChips.add('Donated');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Escaped',
//                             selected: selectedMammalChips.contains('Escaped'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Escaped')) {
//                                   selectedMammalChips.remove('Escaped');
//                                 } else {
//                                   selectedMammalChips.add('Escaped');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Stolen',
//                             selected: selectedMammalChips.contains('Stolen'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Stolen')) {
//                                   selectedMammalChips.remove('Stolen');
//                                 } else {
//                                   selectedMammalChips.add('Stolen');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Trasnferred',
//                             selected:
//                                 selectedMammalChips.contains('Trasnferred'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips
//                                     .contains('Trasnferred')) {
//                                   selectedMammalChips.remove('Trasnferred');
//                                 } else {
//                                   selectedMammalChips.add('Trasnferred');
//                                 }
//                               });
//                             },
//                           ),

//                           // Add more chips here
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Medical State',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8.0,
//                         runSpacing: 8.0,
//                         children: [
//                           CustomTag(
//                             label: 'Injured',
//                             selected: selectedMammalChips.contains('Injured'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Injured')) {
//                                   selectedMammalChips.remove('Injured');
//                                 } else {
//                                   selectedMammalChips.add('Injured');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Sick',
//                             selected: selectedMammalChips.contains('Sick'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Sick')) {
//                                   selectedMammalChips.remove('Sick');
//                                 } else {
//                                   selectedMammalChips.add('Sick');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Quarantined',
//                             selected:
//                                 selectedMammalChips.contains('Quarantined'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips
//                                     .contains('Quarantined')) {
//                                   selectedMammalChips.remove('Quarantined');
//                                 } else {
//                                   selectedMammalChips.add('Quarantined');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Medication',
//                             selected:
//                                 selectedMammalChips.contains('Medication'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips
//                                     .contains('Medication')) {
//                                   selectedMammalChips.remove('Medication');
//                                 } else {
//                                   selectedMammalChips.add('Medication');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Testing',
//                             selected: selectedMammalChips.contains('Testing'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Testing')) {
//                                   selectedMammalChips.remove('Testing');
//                                 } else {
//                                   selectedMammalChips.add('Testing');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Pregnant',
//                             selected: selectedMammalChips.contains('Pregnant'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Pregnant')) {
//                                   selectedMammalChips.remove('Pregnant');
//                                 } else {
//                                   selectedMammalChips.add('Pregnant');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Lactating',
//                             selected: selectedMammalChips.contains('Lactating'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Lactating')) {
//                                   selectedMammalChips.remove('Lactating');
//                                 } else {
//                                   selectedMammalChips.add('Lactating');
//                                 }
//                               });
//                             },
//                           ),

//                           // Add more chips here
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Other',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8.0,
//                         runSpacing: 8.0,
//                         children: [
//                           CustomTag(
//                             label: 'Sold',
//                             selected: selectedMammalChips.contains('Sold'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Sold')) {
//                                   selectedMammalChips.remove('Sold');
//                                 } else {
//                                   selectedMammalChips.add('Sold');
//                                 }
//                               });
//                             },
//                           ),
//                           CustomTag(
//                             label: 'Dead',
//                             selected: selectedMammalChips.contains('Dead'),
//                             onTap: () {
//                               setState(() {
//                                 if (selectedMammalChips.contains('Dead')) {
//                                   selectedMammalChips.remove('Dead');
//                                 } else {
//                                   selectedMammalChips.add('Dead');
//                                 }
//                               });
//                             },
//                           ),
//                           // Add more chips here
//                         ],
//                       ),
//                       const SizedBox(height: 40.0),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Row(children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Handle the button press here
//                                 Navigator.of(context).pop(
//                                     selectedMammalChips); // Close the modal
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color.fromARGB(
//                                     255, 36, 86, 38), // Button color
//                                 foregroundColor: Colors.white, // Text color
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                               ),
//                               child: const Text('Save'), // Button text
//                             ),
//                           ),
//                         ]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );

//     if (result != null) {
//       setState(() {
//         selectedMammalChips = List<String>.from(result);
//       });
//     }
//   }

//   void _showFieldNameModal(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       showDragHandle: true,
//       builder: (BuildContext context) {
//         String fieldName = ''; // Store the field name

//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.35,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Add Custom Field',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       fieldName = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText:
//                         'Enter Field Name', // Change to your desired placeholder
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50.0),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 2.0,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 16.0,
//                     ),
//                   ),
//                   controller:
//                       TextEditingController(), // You can initialize with default text if needed
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 ButtonWidget(
//                   onPressed: () {
//                     Navigator.pop(context); // Close the modal
//                     _showMammalFieldContentModal(context, fieldName);
//                     // Add your continue button logic here
//                   },
//                   buttonText: 'Confirm',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(
//                             255, 238, 238, 238), // Button color
//                         foregroundColor: Colors.black, // Text color
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                       child: const Text('Cancel'), // Button text
//                     ),
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _showMammalFieldContentModal(BuildContext context, String fieldName) {
//     String fieldContent = '';

//     showModalBottomSheet(
//       showDragHandle: true,
//       context: context,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.50,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Add Text Area',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 TextField(
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     labelText:
//                         'Enter Field Content', // Change to your desired placeholder
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 2.0,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 16.0,
//                     ),
//                   ),
//                   onChanged: (value) {
//                     fieldContent = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 ButtonWidget(
//                   onPressed: () {
//                     Navigator.pop(context); // Close the modal
//                     _addMammalNewTextField(fieldName, fieldContent);
//                     // Add your continue button logic here
//                   },
//                   buttonText: 'Confirm',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle the button press here
//                         Navigator.pop(context); // Close the modal
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(
//                             255, 238, 238, 238), // Button color
//                         foregroundColor: Colors.black, // Text color
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                       child: const Text('Cancel'), // Button text
//                     ),
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _addMammalNewTextField(String name, String content) {
//     setState(() {
//       customMammalTextFields.add(
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide: const BorderSide(
//                     color: Colors.grey,
//                     width: 2.0,
//                   ),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 12.0,
//                   horizontal: 16.0,
//                 ),
//               ),
//               controller: TextEditingController(text: content),
//             ),
//             const SizedBox(height: 15), // Add spacing between fields
//           ],
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Mammal'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//             // Handle back button press
//             // Add your code here
//           },
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//               icon: const Icon(Icons.close),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Handle back button press
//                 // Add your code here
//               },
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 25),
//               Center(
//                 child: GestureDetector(
//                   child: CircleAvatar(
//                     radius: 70,
//                     backgroundColor: Colors.grey[100],
//                     backgroundImage: _selectedMammalImage != null
//                         ? FileImage(_selectedMammalImage!)
//                         : null,
//                     child: _selectedMammalImage == null
//                         ? const Icon(
//                             Icons.camera_alt_outlined,
//                             size: 50,
//                             color: Colors.grey,
//                           )
//                         : null,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     _showImagePicker(context);
//                   },
//                   child: const Text(
//                     'Add Photo',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Color.fromARGB(255, 36, 86, 38),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 45),
//               const Text(
//                 "Name",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const CustomTextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 labelText: 'Enter Name',
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Family Tree",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Add Parents If They're In The System",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   const Expanded(
//                     child: Text(
//                       'Add Parents',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Switch(
//                     value: _addMammalParents,
//                     onChanged: (value) {
//                       setState(() {
//                         _addMammalParents = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               Visibility(
//                 visible: _addMammalParents,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         const Expanded(
//                           flex: 4,
//                           child: Text(
//                             'Sire (Father)',
//                             style: TextStyle(fontSize: 16, color: Colors.grey),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 0,
//                           child: TextButton(
//                             onPressed: () {
//                               _showSireSelectionSheet(context);
//                             },
//                             child: Text(
//                               selectedMammalSire,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 36, 86, 38),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Expanded(
//                           flex: 4,
//                           child: Text(
//                             'Dam (Mother)',
//                             style: TextStyle(fontSize: 16, color: Colors.grey),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 0,
//                           child: TextButton(
//                             onPressed: () {
//                               _showDamSelectionSheet(context);
//                             },
//                             child: Text(
//                               selectedMammalDam,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 36, 86, 38),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   const Expanded(
//                     child: Text(
//                       'Add Children',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Switch(
//                     value: _addMammalChildren,
//                     onChanged: (value) {
//                       setState(() {
//                         _addMammalChildren = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const Divider(),
//               const SizedBox(height: 10),
//               const Text(
//                 "Animal Sex",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedMammalGender = 'Unknown';
//                   });
//                 },
//                 child: Row(
//                   children: [
//                     const Expanded(
//                       child: Text(
//                         'Unknown',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: selectedMammalGender == 'Unknown'
//                               ? Colors.green
//                               : Colors.grey,
//                           width: selectedMammalGender == 'Unknown' ? 6.0 : 2.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedMammalGender = 'Male';
//                   });
//                 },
//                 child: Row(
//                   children: [
//                     const Expanded(
//                       child: Text(
//                         'Male',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: selectedMammalGender == 'Male'
//                               ? Colors.green
//                               : Colors.grey,
//                           width: selectedMammalGender == 'Male' ? 6.0 : 2.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedMammalGender = 'Female';
//                   });
//                 },
//                 child: Row(
//                   children: [
//                     const Expanded(
//                       child: Text(
//                         'Female',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: selectedMammalGender == 'Female'
//                               ? Colors.green
//                               : Colors.grey,
//                           width: selectedMammalGender == 'Female' ? 6.0 : 2.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Divider(),
//               const SizedBox(height: 10),
//               const Text(
//                 "Dates",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Date Of Birth",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               DateTextField(
//                 onDateSelected: setSelectedDate,
//               ),
//               _buildMammalDateFields(),
//               TextButton(
//                 onPressed: () {
//                   _showDateSelectionSheet(context);
//                 },
//                 child: const Text(
//                   'Add Date +',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 36, 86, 38),
//                   ),
//                 ),
//               ),
//               const Divider(),
//               const SizedBox(height: 10),
//               const Text(
//                 "Add Tag",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Wrap(
//                 spacing: 8.0,
//                 runSpacing: 8.0,
//                 children: selectedMammalChips.map((chip) {
//                   return CustomTag(
//                     label: chip,
//                     selected: true, // Since these are selected chips
//                     onTap: () {
//                       setState(() {
//                         selectedMammalChips
//                             .remove(chip); // To deselect the chip
//                       });
//                     },
//                   );
//                 }).toList(),
//               ),
//               TextButton(
//                 onPressed: () {
//                   _openModalSheet();
//                 },
//                 child: const Text(
//                   'Add Tags +',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 36, 86, 38),
//                   ),
//                 ),
//               ),
//               const Divider(),
//               const SizedBox(height: 10),
//               const Text(
//                 "Add Custom Fields",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Column(
//                 children: customMammalTextFields,
//               ),
//               TextButton(
//                 onPressed: () {
//                   _showFieldNameModal(context);
//                 },
//                 child: const Text(
//                   'Add Custom Field +',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 36, 86, 38),
//                   ),
//                 ),
//               ),
//               const Divider(),
//               const SizedBox(height: 10),
//               const Text(
//                 "Additional Notes",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 maxLines: 6, // Set the maximum number of lines
//                 controller: _notesController,
//                 decoration: InputDecoration(
//                   hintText:
//                       'Add Additional Information If Needed', // Add your hint text here
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                       vertical: 12.0, horizontal: 16.0),
//                 ),
//                 textInputAction:
//                     TextInputAction.done, // Change the keyboard action
//               ),
//               const SizedBox(height: 30),
//               GestureDetector(
//                 onTap: () {
//                   // Add your logic to open the file manager and select files here
//                 },
//                 child: DottedBorder(
//                   borderType: BorderType.RRect,
//                   radius: const Radius.circular(20),
//                   dashPattern: const [7, 7],
//                   strokeWidth: 1,
//                   color: Colors.grey,
//                   child: SizedBox(
//                     width: double.infinity, // Set the width of the container
//                     height: 150, // Set the height of the container
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: const Icon(
//                             Icons.file_open_outlined,
//                             size: 35,
//                           ),
//                           onPressed: () {
//                             // Handle back button press
//                             // Add your code here
//                           },
//                         ),
//                         const Text(
//                           'Upload File, PDF, Jpeg, PNG',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ElevatedButton(
//           onPressed: () {
//             // Handle "Continue" button press
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color.fromARGB(255, 36, 86, 38),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50),
//             ),
//           ),
//           child: const Text(
//             'Save',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMammalDateFields() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: selectedMammalDates.keys.map((dateType) {
//         final DateTime? selectedDate = selectedMammalDates[dateType];
//         return selectedDate != null
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     dateType,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'DD:MM:YYYY', // Add your hint text here
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                             50.0), // Adjust border radius as needed
//                         borderSide: const BorderSide(
//                           color: Colors.grey, // Change the border color here
//                           width: 2.0, // Change the border width here
//                         ),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 12.0,
//                           horizontal: 16.0), // Adjust padding as needed
//                       suffixIcon: GestureDetector(
//                         onTap: () {
//                           _showMammalDatePicker(context, dateType);
//                         },
//                         child: const Icon(
//                           Icons.calendar_today,
//                           color: Color.fromARGB(255, 36, 86, 38),
//                         ),
//                       ),
//                     ),
//                     readOnly: true,
//                     controller: TextEditingController(
//                       text: DateFormat('dd-MM-yyyy').format(selectedDate),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               )
//             : Container();
//       }).toList(),
//     );
//   }
// }
