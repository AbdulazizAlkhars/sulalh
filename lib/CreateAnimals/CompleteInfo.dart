import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/TagChips.dart';
import 'package:hathera_demo/Widgets/Textformfield.dart';
import 'package:hathera_demo/Widgets/datetextfiled.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CompleteInfo extends StatefulWidget {
  const CompleteInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompleteInfo createState() => _CompleteInfo();
}

class _CompleteInfo extends State<CompleteInfo> {
  final TextEditingController _notesController = TextEditingController();
  String selectedSire = 'Add';
  String selectedDam = 'Add';
  DateTime? selectedDate;
  List<String> selectedChips = [];
  List<Widget> customTextFields = [];
  Map<String, DateTime?> selectedDates = {};
  String selectedDateType = "Date Of Birth"; // Default value
  // Initial text for the button
  String selectedGender = '';
  bool _addParents = false;
  bool _addChildren = false;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

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
                  final pickedImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _selectedImage = File(pickedImage.path);
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

  void _showSireSelectionSheet(BuildContext context) async {
    final String? newSire = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> SireDetails = [
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
                                  SireDetails = [
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
                        itemCount: SireDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(SireDetails[index]['name']![0]),
                            ),
                            title: Text(SireDetails[index]['name']!),
                            subtitle: Text(SireDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, SireDetails[index]['name']);
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
    if (newSire != null) {
      setState(() {
        selectedSire = newSire;
      });
    }
  }

  void _showDamSelectionSheet(BuildContext context) async {
    final String? newDam = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> DamDetails = [
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
                                  DamDetails = [
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
                        itemCount: DamDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(DamDetails[index]['name']![0]),
                            ),
                            title: Text(DamDetails[index]['name']!),
                            subtitle: Text(DamDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(context, DamDetails[index]['name']);
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

    if (newDam != null) {
      setState(() {
        selectedDam = newDam;
      });
    }
  }

  void _showDateSelectionSheet(BuildContext context) async {
    List<String> dateTypes = [
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
                  itemCount: dateTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(dateTypes[index]),
                          dense: true,
                          minVerticalPadding: double.minPositive,
                          trailing: const Icon(Icons.arrow_right_alt_rounded),
                          onTap: () {
                            Navigator.pop(context);
                            _showDatePicker(context, dateTypes[index]);
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

  void _showDatePicker(BuildContext context, String dateType) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: DateTime.now().year,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime pickedDate) {
              setState(() {
                selectedDates[dateType] = pickedDate;
              });
            },
          ),
        );
      },
    );
  }

  void _openModalSheet() async {
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
                            selected: selectedChips.contains('Borrowed'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Borrowed')) {
                                  selectedChips.remove('Borrowed');
                                } else {
                                  selectedChips.add('Borrowed');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Adopted',
                            selected: selectedChips.contains('Adopted'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Adopted')) {
                                  selectedChips.remove('Adopted');
                                } else {
                                  selectedChips.add('Adopted');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Donated',
                            selected: selectedChips.contains('Donated'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Donated')) {
                                  selectedChips.remove('Donated');
                                } else {
                                  selectedChips.add('Donated');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Escaped',
                            selected: selectedChips.contains('Escaped'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Escaped')) {
                                  selectedChips.remove('Escaped');
                                } else {
                                  selectedChips.add('Escaped');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Stolen',
                            selected: selectedChips.contains('Stolen'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Stolen')) {
                                  selectedChips.remove('Stolen');
                                } else {
                                  selectedChips.add('Stolen');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Trasnferred',
                            selected: selectedChips.contains('Trasnferred'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Trasnferred')) {
                                  selectedChips.remove('Trasnferred');
                                } else {
                                  selectedChips.add('Trasnferred');
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
                            selected: selectedChips.contains('Injured'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Injured')) {
                                  selectedChips.remove('Injured');
                                } else {
                                  selectedChips.add('Injured');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Sick',
                            selected: selectedChips.contains('Sick'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Sick')) {
                                  selectedChips.remove('Sick');
                                } else {
                                  selectedChips.add('Sick');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Quarantined',
                            selected: selectedChips.contains('Quarantined'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Quarantined')) {
                                  selectedChips.remove('Quarantined');
                                } else {
                                  selectedChips.add('Quarantined');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Medication',
                            selected: selectedChips.contains('Medication'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Medication')) {
                                  selectedChips.remove('Medication');
                                } else {
                                  selectedChips.add('Medication');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Testing',
                            selected: selectedChips.contains('Testing'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Testing')) {
                                  selectedChips.remove('Testing');
                                } else {
                                  selectedChips.add('Testing');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Pregnant',
                            selected: selectedChips.contains('Pregnant'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Pregnant')) {
                                  selectedChips.remove('Pregnant');
                                } else {
                                  selectedChips.add('Pregnant');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Lactating',
                            selected: selectedChips.contains('Lactating'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Lactating')) {
                                  selectedChips.remove('Lactating');
                                } else {
                                  selectedChips.add('Lactating');
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
                            selected: selectedChips.contains('Sold'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Sold')) {
                                  selectedChips.remove('Sold');
                                } else {
                                  selectedChips.add('Sold');
                                }
                              });
                            },
                          ),
                          CustomTag(
                            label: 'Dead',
                            selected: selectedChips.contains('Dead'),
                            onTap: () {
                              setState(() {
                                if (selectedChips.contains('Dead')) {
                                  selectedChips.remove('Dead');
                                } else {
                                  selectedChips.add('Dead');
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
                                    .pop(selectedChips); // Close the modal
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
        selectedChips = List<String>.from(result);
      });
    }
  }

  void _showFieldNameModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        String fieldName = ''; // Store the field name

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
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
                    _showFieldContentModal(context, fieldName);
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

  void _showFieldContentModal(BuildContext context, String fieldName) {
    String fieldContent = '';

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
                    _addNewTextField(fieldName, fieldContent);
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

  void _addNewTextField(String name, String content) {
    setState(() {
      customTextFields.add(
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
        title: const Text('Create Animal'),
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
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
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
              const CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Enter Name',
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
                    value: _addParents,
                    onChanged: (value) {
                      setState(() {
                        _addParents = value;
                      });
                    },
                  ),
                ],
              ),
              Visibility(
                visible: _addParents,
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
                              _showSireSelectionSheet(context);
                            },
                            child: Text(
                              selectedSire,
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
                              _showDamSelectionSheet(context);
                            },
                            child: Text(
                              selectedDam,
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
                    value: _addChildren,
                    onChanged: (value) {
                      setState(() {
                        _addChildren = value;
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
                    selectedGender = 'Unknown';
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
                          color: selectedGender == 'Unknown'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedGender == 'Unknown' ? 6.0 : 2.0,
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
                    selectedGender = 'Male';
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
                          color: selectedGender == 'Male'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedGender == 'Male' ? 6.0 : 2.0,
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
                    selectedGender = 'Female';
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
                          color: selectedGender == 'Female'
                              ? Colors.green
                              : Colors.grey,
                          width: selectedGender == 'Female' ? 6.0 : 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
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
              const DateTextField(),
              _buildDateFields(),
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
                children: selectedChips.map((chip) {
                  return CustomTag(
                    label: chip,
                    selected: true, // Since these are selected chips
                    onTap: () {
                      setState(() {
                        selectedChips.remove(chip); // To deselect the chip
                      });
                    },
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  _openModalSheet();
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
                children: customTextFields,
              ),
              TextButton(
                onPressed: () {
                  _showFieldNameModal(context);
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
            // Handle "Continue" button press
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

  Widget _buildDateFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: selectedDates.keys.map((dateType) {
        final DateTime? selectedDate = selectedDates[dateType];
        return selectedDate != null
            ? Column(
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
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'DD:MM:YYYY', // Add your hint text here
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            50.0), // Adjust border radius as needed
                        borderSide: const BorderSide(
                          color: Colors.grey, // Change the border color here
                          width: 2.0, // Change the border width here
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0), // Adjust padding as needed
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _showDatePicker(context, dateType);
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
                  const SizedBox(height: 10),
                ],
              )
            : Container();
      }).toList(),
    );
  }
}
