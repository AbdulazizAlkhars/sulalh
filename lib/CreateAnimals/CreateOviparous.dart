import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/OviparousGeneralInfo.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';

import 'package:hathera_demo/Widgets/datetextfiled.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CreateOviparousPage extends StatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  CreateOviparousPage(
      {required this.selectedAnimalType,
      required this.selectedAnimalSpecies,
      required this.selectedAnimalBreed});

  @override
  // ignore: library_private_types_in_public_api
  _CreateOviparousPage createState() => _CreateOviparousPage();
}

class _CreateOviparousPage extends State<CreateOviparousPage> {
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _frequencyEggsController =
      TextEditingController();
  final TextEditingController _numberofEggsController = TextEditingController();
  String fieldName = '';
  String fieldContent = '';
  String selectedOviSire = 'Add';
  String selectedOviDam = 'Add';
  String selectedDate = '';

  void setSelectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  List<String> selectedOviChips = [];
  List<Widget> customOviTextFields = [];
  Map<String, DateTime?> selectedOviDates = {};
  bool showAdditionalFields = false;
  String selectedOviDateType = "Date Of Birth"; // Default value
  // Initial text for the button
  String selectedOviGender = '';
  bool _addOviParents = false;
  bool _addOviChildren = false;
  final ImagePicker _Ovipicker = ImagePicker();
  File? _selectedOviImage;

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
                  final pickedOviImage =
                      await _Ovipicker.pickImage(source: ImageSource.camera);
                  if (pickedOviImage != null) {
                    setState(() {
                      _selectedOviImage = File(pickedOviImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedOviImage =
                      await _Ovipicker.pickImage(source: ImageSource.gallery);
                  if (pickedOviImage != null) {
                    setState(() {
                      _selectedOviImage = File(pickedOviImage.path);
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

  void _showOviSireSelectionSheet(BuildContext context) async {
    final String? newOviSire = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> OviSireDetails = [
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
                                  OviSireDetails = [
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
                        itemCount: OviSireDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(OviSireDetails[index]['name']![0]),
                            ),
                            title: Text(OviSireDetails[index]['name']!),
                            subtitle: Text(OviSireDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, OviSireDetails[index]['name']);
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
    if (newOviSire != null) {
      setState(() {
        selectedOviSire = newOviSire;
      });
    }
  }

  void _showOviDamSelectionSheet(BuildContext context) async {
    final String? newOviDam = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> OviDamDetails = [
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
                                  OviDamDetails = [
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
                        itemCount: OviDamDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(OviDamDetails[index]['name']![0]),
                            ),
                            title: Text(OviDamDetails[index]['name']!),
                            subtitle: Text(OviDamDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, OviDamDetails[index]['name']);
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

    if (newOviDam != null) {
      setState(() {
        selectedOviDam = newOviDam;
      });
    }
  }

  void _showDateSelectionSheet(BuildContext context) async {
    List<String> OvidateTypes = [
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
            ],
          ),
        );
      },
    );
  }

  void _showOviDatePicker(BuildContext context, String OvidateType) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            initialDateTime: selectedOviDates[OvidateType] ?? DateTime.now(),
            minimumYear: 2000,
            maximumYear: DateTime.now().year,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime pickedOviDate) {
              setState(() {
                selectedOviDates.putIfAbsent(OvidateType, () => pickedOviDate);
              });
            },
          ),
        );
      },
    );
  }

  void _openOviModalSheet() async {
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
                            selected: selectedOviChips.contains('Borrowed'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Borrowed')) {
                                  selectedOviChips.remove('Borrowed');
                                } else {
                                  selectedOviChips.add('Borrowed');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Adopted',
                            selected: selectedOviChips.contains('Adopted'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Adopted')) {
                                  selectedOviChips.remove('Adopted');
                                } else {
                                  selectedOviChips.add('Adopted');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Donated',
                            selected: selectedOviChips.contains('Donated'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Donated')) {
                                  selectedOviChips.remove('Donated');
                                } else {
                                  selectedOviChips.add('Donated');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Escaped',
                            selected: selectedOviChips.contains('Escaped'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Escaped')) {
                                  selectedOviChips.remove('Escaped');
                                } else {
                                  selectedOviChips.add('Escaped');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Stolen',
                            selected: selectedOviChips.contains('Stolen'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Stolen')) {
                                  selectedOviChips.remove('Stolen');
                                } else {
                                  selectedOviChips.add('Stolen');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Trasnferred',
                            selected: selectedOviChips.contains('Trasnferred'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Trasnferred')) {
                                  selectedOviChips.remove('Trasnferred');
                                } else {
                                  selectedOviChips.add('Trasnferred');
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
                            selected: selectedOviChips.contains('Injured'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Injured')) {
                                  selectedOviChips.remove('Injured');
                                } else {
                                  selectedOviChips.add('Injured');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Sick',
                            selected: selectedOviChips.contains('Sick'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Sick')) {
                                  selectedOviChips.remove('Sick');
                                } else {
                                  selectedOviChips.add('Sick');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Quarantined',
                            selected: selectedOviChips.contains('Quarantined'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Quarantined')) {
                                  selectedOviChips.remove('Quarantined');
                                } else {
                                  selectedOviChips.add('Quarantined');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Medication',
                            selected: selectedOviChips.contains('Medication'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Medication')) {
                                  selectedOviChips.remove('Medication');
                                } else {
                                  selectedOviChips.add('Medication');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Testing',
                            selected: selectedOviChips.contains('Testing'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Testing')) {
                                  selectedOviChips.remove('Testing');
                                } else {
                                  selectedOviChips.add('Testing');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Pregnant',
                            selected: selectedOviChips.contains('Pregnant'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Pregnant')) {
                                  selectedOviChips.remove('Pregnant');
                                } else {
                                  selectedOviChips.add('Pregnant');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Lactating',
                            selected: selectedOviChips.contains('Lactating'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Lactating')) {
                                  selectedOviChips.remove('Lactating');
                                } else {
                                  selectedOviChips.add('Lactating');
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
                            selected: selectedOviChips.contains('Sold'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Sold')) {
                                  selectedOviChips.remove('Sold');
                                } else {
                                  selectedOviChips.add('Sold');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Dead',
                            selected: selectedOviChips.contains('Dead'),
                            onTap: () {
                              setState(() {
                                if (selectedOviChips.contains('Dead')) {
                                  selectedOviChips.remove('Dead');
                                } else {
                                  selectedOviChips.add('Dead');
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
                                Navigator.of(context)
                                    .pop(selectedOviChips); // Close the modal
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
                    setState(() {
                      fieldName = value;
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
                    _showOviFieldContentModal(context, fieldName);
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

  void _showOviFieldContentModal(BuildContext context, String fieldName) {
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
                    fieldContent = value;
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ButtonWidget(
                  onPressed: () {
                    Navigator.pop(context); // Close the modal
                    _addNewOviTextField(fieldName, fieldContent);
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

  void _addNewOviTextField(String name, String content) {
    setState(() {
      customOviTextFields.add(
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
        title: const Text('Create Oviparous'),
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
                    backgroundImage: _selectedOviImage != null
                        ? FileImage(_selectedOviImage!)
                        : null,
                    child: _selectedOviImage == null
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
                controller: _nameController,
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
                    value: _addOviParents,
                    onChanged: (value) {
                      setState(() {
                        _addOviParents = value;
                      });
                    },
                  ),
                ],
              ),
              Visibility(
                visible: _addOviParents,
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
                              _showOviSireSelectionSheet(context);
                            },
                            child: Text(
                              selectedOviSire,
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
                              _showOviDamSelectionSheet(context);
                            },
                            child: Text(
                              selectedOviDam,
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
                    value: _addOviChildren,
                    onChanged: (value) {
                      setState(() {
                        _addOviChildren = value;
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
                    selectedOviGender = 'Unknown';
                    showAdditionalFields = false;
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
                          color: selectedOviGender == 'Unknown'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedOviGender == 'Unknown' ? 6.0 : 2.0,
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
                    selectedOviGender = 'Male';
                    showAdditionalFields = false;
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
                          color: selectedOviGender == 'Male'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedOviGender == 'Male' ? 6.0 : 2.0,
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
                    selectedOviGender = 'Female';
                    showAdditionalFields =
                        true; // Show additional fields when Female is selected
                  });
                },
                child: Row(
                  children: [
                    Expanded(
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
                          color: selectedOviGender == 'Female'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedOviGender == 'Female' ? 6.0 : 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              if (showAdditionalFields) // Show additional fields when Female is selected
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                    SizedBox(height: 10),
                    Text(
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
              _buildOviDateFields(),
              TextButton(
                onPressed: () {
                  _showDateSelectionSheet(context);
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
                children: selectedOviChips.map((chip) {
                  return CustomTag(
                    label: chip,
                    selected: true, // Since these are selected chips
                    onTap: () {
                      setState(() {
                        selectedOviChips.remove(chip); // To deselect the chip
                      });
                    },
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  _openOviModalSheet();
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
                children: customOviTextFields,
              ),
              TextButton(
                onPressed: () {
                  _showOviFieldNameModal(context);
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
                controller: _notesController,
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
                builder: (context) => OvigenifnoPage(
                  fieldName: fieldName,
                  fieldContent: fieldContent,
                  numberofEggsController: _numberofEggsController,
                  frequencyEggsController: _frequencyEggsController,
                  nameController: _nameController,
                  notesController: _notesController,
                  selectedOviSire: selectedOviSire,
                  selectedDate: selectedDate,
                  selectedOviDam: selectedOviDam,
                  selectedOviChips: selectedOviChips,
                  selectedOviDates: selectedOviDates,
                  showAdditionalFields: showAdditionalFields,
                  selectedOviDateType: selectedOviDateType,
                  selectedOviGender: selectedOviGender,
                  addOviParents: _addOviParents,
                  addOviChildren: _addOviChildren,
                  selectedOviImage: _selectedOviImage,
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

  Widget _buildOviDateFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: selectedOviDates.keys.map((dateType) {
        final selectedDate = selectedOviDates[dateType];
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
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedOviDates[dateType] = null;
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
