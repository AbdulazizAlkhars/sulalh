import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';
import 'package:hathera_demo/Widgets/datetextfiled.dart';

// ignore: depend_on_referenced_packages

class CreateBreedingEvents extends StatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  CreateBreedingEvents(
      {required this.selectedAnimalType,
      required this.selectedAnimalSpecies,
      required this.selectedAnimalBreed});

  @override
  // ignore: library_private_types_in_public_api
  _CreateBreedingEvents createState() => _CreateBreedingEvents();
}

class _CreateBreedingEvents extends State<CreateBreedingEvents> {
  final TextEditingController _BreedingnotesController =
      TextEditingController();
  final TextEditingController _breedingeventnumberController =
      TextEditingController();
  String selectedBreedSire = 'Add';
  String selectedBreedDam = 'Add';
  String selectedBreedPartner = 'Add';
  String selectedBreedChildren = '';
  String selectedBreedingDate = '';
  String selectedDeliveryDate = '';

  void setBreedingSelectedDate(String Breedingdate) {
    setState(() {
      selectedBreedingDate = Breedingdate;
    });
  }

  void setDeliverySelectedDate(String Deliverydate) {
    setState(() {
      selectedDeliveryDate = Deliverydate;
    });
  }

  void _showBreedSireSelectionSheet(BuildContext context) async {
    final String? newBreedSire = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> BreedSireDetails = [
          {'name': 'John', 'nickname': 'Cow'},
          {'name': 'Mustang', 'nickname': 'Sheep'},
          {'name': 'Bustefal', 'nickname': 'Horse'},
          {'name': 'Coleisum', 'nickname': 'Ox'},
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
                    1, // 75% of screen height
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
                                  BreedSireDetails = [
                                    {'name': 'John', 'nickname': 'Cow'},
                                    {'name': 'Mustang', 'nickname': 'Sheep'},
                                    {'name': 'Bustefal', 'nickname': 'Horse'},
                                    {'name': 'Coleisum', 'nickname': 'Ox'},
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
                        itemCount: BreedSireDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(BreedSireDetails[index]['name']![0]),
                            ),
                            title: Text(BreedSireDetails[index]['name']!),
                            subtitle:
                                Text(BreedSireDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, BreedSireDetails[index]['name']);
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
    if (newBreedSire != null) {
      setState(() {
        selectedBreedSire = newBreedSire;
      });
    }
  }

  void _showBreedDamSelectionSheet(BuildContext context) async {
    final String? newBreedDam = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> BreedDamDetails = [
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
                    1, // 75% of screen height
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
                                  BreedDamDetails = [
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
                        itemCount: BreedDamDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(BreedDamDetails[index]['name']![0]),
                            ),
                            title: Text(BreedDamDetails[index]['name']!),
                            subtitle: Text(BreedDamDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, BreedDamDetails[index]['name']);
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

    if (newBreedDam != null) {
      setState(() {
        selectedBreedDam = newBreedDam;
      });
    }
  }

  void _showBreedChildrenSelectionSheet(BuildContext context) async {
    List<String> selectedChildren = []; // Initialize an empty list

    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        List<Map<String, String>> breedChildrenDetails = [
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
                height: MediaQuery.of(context).size.height * 1,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Select Children",
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
                                  breedChildrenDetails = [
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
                        itemCount: breedChildrenDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String name =
                              breedChildrenDetails[index]['name']!;
                          final String nickname =
                              breedChildrenDetails[index]['nickname']!;
                          final bool isSelected =
                              selectedChildren.contains(name);

                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(name[0]),
                            ),
                            title: Text(name),
                            subtitle: Text(nickname),
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedChildren.remove(name);
                                } else {
                                  selectedChildren.add(name);
                                }
                              });
                            },
                            tileColor: isSelected
                                ? Colors.blue.withOpacity(0.5)
                                : null,
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, selectedChildren);
                      },
                      child: const Text("Done"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (selectedChildren.isNotEmpty) {
      setState(() {
        // Assuming you have a List<String> selectedBreedChildren
        selectedBreedChildren =
            selectedChildren.join(", "); // Join selected children into a string
      });
    }
  }

  void _showBreedPartnerSelectionSheet(BuildContext context) async {
    final String? newBreedPartner = await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ignore: non_constant_identifier_names
        List<Map<String, String>> BreedPartnerDetails = [
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
                    1, // 75% of screen height
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
                                  BreedPartnerDetails = [
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
                        itemCount: BreedPartnerDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child:
                                  Text(BreedPartnerDetails[index]['name']![0]),
                            ),
                            title: Text(BreedPartnerDetails[index]['name']!),
                            subtitle:
                                Text(BreedPartnerDetails[index]['nickname']!),
                            onTap: () {
                              Navigator.pop(
                                  context, BreedPartnerDetails[index]['name']);
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

    if (newBreedPartner != null) {
      setState(() {
        selectedBreedPartner = newBreedPartner;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry'),
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
              const Text(
                'Create Event',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Breeding Event Num",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _breedingeventnumberController,
                decoration: InputDecoration(
                  hintText: 'Enter Breeding Number', // Add your hint text here
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
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Breeding ID',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '001-1',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
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
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: TextButton(
                          onPressed: () {
                            _showBreedSireSelectionSheet(context);
                          },
                          child: Text(
                            selectedBreedSire,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 36, 86, 38),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Text(
                          'Dam (Mother)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: TextButton(
                          onPressed: () {
                            _showBreedDamSelectionSheet(context);
                          },
                          child: Text(
                            selectedBreedDam,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 36, 86, 38),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Text(
                          'Breeding Partner',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: TextButton(
                          onPressed: () {
                            _showBreedPartnerSelectionSheet(context);
                          },
                          child: Text(
                            selectedBreedPartner,
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
              const SizedBox(height: 20),
              const Text(
                "Breeding Date",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DateTextField(
                onDateSelected: setBreedingSelectedDate,
              ),
              const SizedBox(height: 10),
              const Text(
                "Delivery Date",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DateTextField(
                onDateSelected: setDeliverySelectedDate,
              ),
              const SizedBox(height: 25),
              const Text(
                "Add Children +",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                selectedBreedChildren,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 86, 38),
                ),
              ),
              TextButton(
                onPressed: () {
                  _showBreedChildrenSelectionSheet(context);
                },
                child: Text(
                  "Add Children +",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "Notes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 6, // Set the maximum number of lines
                controller: _BreedingnotesController,
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
                builder: (context) => ListOfBreedingEvents(
                  breedingNotesController: _BreedingnotesController,
                  breedingEventNumberController: _breedingeventnumberController,
                  selectedBreedSire: selectedBreedSire,
                  selectedBreedDam: selectedBreedDam,
                  selectedBreedPartner: selectedBreedPartner,
                  selectedBreedChildren: selectedBreedChildren,
                  selectedBreedingDate: selectedBreedingDate,
                  selectedDeliveryDate: selectedDeliveryDate,
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
            'Create Event',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
