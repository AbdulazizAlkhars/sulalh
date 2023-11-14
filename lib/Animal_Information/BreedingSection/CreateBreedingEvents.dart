import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Widgets/datetextfiled.dart';

// ignore: depend_on_referenced_packages

class CreateBreedingEvents extends ConsumerStatefulWidget {
  final OviVariables OviDetails;

  CreateBreedingEvents({super.key, required this.OviDetails});

  @override
  // ignore: library_private_types_in_public_api
  _CreateBreedingEvents createState() => _CreateBreedingEvents();
}

class _CreateBreedingEvents extends ConsumerState<CreateBreedingEvents> {
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
      ref.read(breedingDateProvider.notifier).update((state) => Breedingdate);
    });
  }

  void setDeliverySelectedDate(String Deliverydate) {
    setState(() {
      ref.read(deliveryDateProvider.notifier).update((state) => Deliverydate);
    });
  }

  void _showBreedSireSelectionSheet() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.5;

    TextEditingController searchController = TextEditingController();
    List<Map<String, String>> filteredbreedSires = List.from(breedSires);

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
                          filteredbreedSires = breedSires
                              .where((sire) => sire['name']!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Search Sire",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredbreedSires.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: Text(filteredbreedSires[index]['name']!),
                          onTap: () {
                            final selectedSire =
                                filteredbreedSires[index]['name']!;
                            ref
                                .read(breedingSireDetailsProvider.notifier)
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

  final List<Map<String, String>> breedSires = [
    {'name': 'Alice'},
    {'name': 'John'},
    {'name': 'Jack'},
    {'name': 'Kiran'},
    {'name': 'Mantic'},
    {'name': 'Mongolia'},
    // Add more country codes and names as needed
  ];

  void _showBreedDamSelectionSheet(BuildContext context) async {
    String selectedbreedingDam =
        ''; // Initialize an empty string for the selected item
    final ovianimals = ref.watch(ovianimalsProvider);
    double sheetHeight = MediaQuery.of(context).size.height * 0.8;
    String searchQuery = '';

    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: sheetHeight,
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Select Dam(Mother)",
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
                                  searchQuery = value.toLowerCase();
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
                        shrinkWrap: true,
                        itemCount: ovianimals.length,
                        itemBuilder: (context, index) {
                          final OviDetails = ovianimals[index];

                          final bool isSelected =
                              selectedbreedingDam == OviDetails.animalName;

                          // Apply the filter here
                          if (!OviDetails.animalName
                                  .toLowerCase()
                                  .contains(searchQuery) &&
                              !OviDetails.selectedAnimalType
                                  .toLowerCase()
                                  .contains(searchQuery)) {
                            return Container(); // Skip this item if it doesn't match the search query
                          }

                          return ListTile(
                            tileColor: isSelected
                                ? Colors.green.withOpacity(0.5)
                                : null,
                            shape: isSelected
                                ? RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )
                                : null,
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[100],
                              backgroundImage:
                                  OviDetails.selectedOviImage != null
                                      ? FileImage(OviDetails.selectedOviImage!)
                                      : null,
                              child: OviDetails.selectedOviImage == null
                                  ? const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    )
                                  : null,
                            ),
                            title: Text(OviDetails.animalName),
                            subtitle: Text(OviDetails.selectedAnimalType),
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedbreedingDam = ''; // Deselect the item
                                } else {
                                  selectedbreedingDam = OviDetails.animalName;
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(breedingDamDetailsProvider.notifier)
                            .update((state) => selectedbreedingDam);
                        Navigator.pop(context, selectedbreedingDam);
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
  }

  //   if (selectedChildren.isNotEmpty) {
  //     setState(() {
  //       // Assuming you have a List<String> selectedBreedChildren
  //       selectedBreedChildren =
  //           selectedChildren.join(", "); // Join selected children into a string
  //     });
  //   }
  // }

  void _showBreedChildrenSelectionSheet(BuildContext context) async {
    List<String> selectedChildren = []; // Initialize an empty list
    final ovianimals = ref.watch(ovianimalsProvider);

    String searchQuery = '';

    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
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
                                  searchQuery = value.toLowerCase();
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
                        shrinkWrap: true,
                        itemCount: ovianimals.length,
                        itemBuilder: (context, index) {
                          final OviDetails = ovianimals[index];

                          final bool isSelected =
                              selectedChildren.contains(OviDetails.animalName);

                          // Apply the filter here
                          if (!OviDetails.animalName
                                  .toLowerCase()
                                  .contains(searchQuery) &&
                              !OviDetails.selectedAnimalType
                                  .toLowerCase()
                                  .contains(searchQuery)) {
                            return Container(); // Skip this item if it doesn't match the search query
                          }

                          return ListTile(
                            tileColor: isSelected
                                ? Colors.green.withOpacity(0.5)
                                : null,
                            shape: isSelected
                                ? RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )
                                : null,
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[100],
                              backgroundImage:
                                  OviDetails.selectedOviImage != null
                                      ? FileImage(OviDetails.selectedOviImage!)
                                      : null,
                              child: OviDetails.selectedOviImage == null
                                  ? const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                      color: Colors.grey,
                                    )
                                  : null,
                            ),
                            title: Text(OviDetails.animalName),
                            subtitle: Text(OviDetails.selectedAnimalType),
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedChildren
                                      .remove(OviDetails.animalName);
                                } else {
                                  selectedChildren.add(OviDetails.animalName);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(breedingChildrenDetailsProvider.notifier)
                            .update((state) => selectedBreedChildren);

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

  void _showBreedPartnerSelectionSheet() {
    double sheetHeight = MediaQuery.of(context).size.height * 0.5;

    TextEditingController searchController = TextEditingController();
    List<Map<String, String>> filteredbreedPartner = List.from(breedPartner);

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
                          filteredbreedPartner = breedPartner
                              .where((partner) => partner['name']!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Search Partner",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredbreedPartner.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: Text(filteredbreedPartner[index]['name']!),
                          onTap: () {
                            final selectedPartner =
                                filteredbreedPartner[index]['name']!;
                            ref
                                .read(breedingPartnerDetailsProvider.notifier)
                                .update((state) => selectedPartner);
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

  final List<Map<String, String>> breedPartner = [
    {'name': 'Alice'},
    {'name': 'John'},
    {'name': 'Jack'},
    {'name': 'Kiran'},
    {'name': 'Mantic'},
    {'name': 'Mongolia'},
    // Add more country codes and names as needed
  ];

  @override
  Widget build(BuildContext context) {
    final selectedbreedSire = ref.watch(breedingSireDetailsProvider);
    final selectedbreedDam = ref.watch(breedingDamDetailsProvider);
    final selectedbreedPartner = ref.watch(breedingPartnerDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.OviDetails.animalName),
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
                onChanged: (value) {
                  ref
                      .read(breedingEventNumberProvider.notifier)
                      .update((state) => value);
                },
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
                            _showBreedSireSelectionSheet();
                          },
                          child: Text(
                            selectedbreedSire,
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
                            selectedbreedDam,
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
                            _showBreedPartnerSelectionSheet();
                          },
                          child: Text(
                            selectedbreedPartner,
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
                onChanged: (value) {
                  ref
                      .read(breedingnotesProvider.notifier)
                      .update((state) => value);
                },
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
                  OviDetails: widget.OviDetails, shouldAddBreedEvent: true,

                  // breedingNotesController: _BreedingnotesController,
                  // breedingEventNumberController: _breedingeventnumberController,
                  // selectedBreedSire: selectedBreedSire,
                  // selectedBreedDam: selectedBreedDam,
                  // selectedBreedPartner: selectedBreedPartner,
                  // selectedBreedChildren: selectedBreedChildren,
                  // selectedBreedingDate: selectedBreedingDate,
                  // selectedDeliveryDate: selectedDeliveryDate,
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
