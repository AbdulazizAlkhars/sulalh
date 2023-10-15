import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/AnimalManagement/AnimalFilters.dart';
import 'package:hathera_demo/Animal_Information/OviparousGeneralInfo.dart';
import 'package:hathera_demo/CreateAnimals/CreateAnimal1.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';

class OviVariables {
  final List<String> selectedFilters;
  final String eventNumber;
  final String selectedOviSire;
  final String selectedOviDam;
  final String selectedDate;
  final String fieldName;
  final String fieldContent;
  final String notes;
  final String selectedOviGender;
  final Map<String, DateTime?> selectedOviDates;
  final String selectedAnimalBreed;
  final String selectedAnimalSpecies;
  final String selectedAnimalType;
  final List<String> selectedOviChips;
  final File? selectedOviImage;

  // final String children;
  // final String breedingDate;
  // final String deliveryDate;
  // final String notes;
  final String species;

  OviVariables({
    required this.selectedFilters,
    required this.eventNumber,
    required this.selectedOviSire,
    required this.selectedOviDam,
    required this.selectedDate,
    required this.selectedOviGender,
    required this.fieldName,
    required this.fieldContent,
    required this.notes,
    required this.selectedOviDates,
    required this.selectedAnimalBreed,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalType,
    required this.selectedOviChips,
    required this.selectedOviImage,

    // required this.children,
    // required this.breedingDate,
    // required this.deliveryDate,
    // required this.notes,
    required this.species,
  });
}

List<OviVariables> OviAnimals = [];

// ignore: must_be_immutable
class ListOfAnimals extends ConsumerStatefulWidget {
  final List<String> selectedFilters;
  final bool shouldAddAnimal;
  // Define the variables to hold the data
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

  // Constructor to receive the data
  ListOfAnimals({
    super.key,
    required this.shouldAddAnimal,
    required this.selectedFilters,
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
  });

  @override
  ConsumerState<ListOfAnimals> createState() => _ListOfAnimals();
}

class _ListOfAnimals extends ConsumerState<ListOfAnimals> {
  String filterQuery = '';
  bool shouldAddAnimal = false;

  @override
  void initState() {
    // final animalName = ref.watch(animalNameProvider);
    super.initState();
    _updateFilteredOviAnimals();

    // Add the initial breeding event to the list only if shouldAddAnimal is true
    if (widget.nameController.text.isNotEmpty && widget.shouldAddAnimal) {
      addOviAnimal(widget.nameController.text);
    }
  }

  void addOviAnimal(String eventNumber) {
    final container = ProviderContainer();
    final animalSire = container.read(animalSireDetailsProvider);
    final animalDam = container.read(animalDamDetailsProvider);
    // ... (read other providers similarly)
    // final selectedAnimalImage = ref.watch(selectedAnimalImageProvider);
    // ignore: non_constant_identifier_names
    final OviDetails = OviVariables(
      eventNumber: eventNumber,
      selectedOviSire: animalSire,
      selectedOviDam: animalDam,
      species: widget.selectedAnimalSpecies,
      selectedDate: widget.selectedDate,
      fieldName: widget.fieldName,
      fieldContent: widget.fieldContent,
      notes: widget.notesController.text,
      selectedOviGender: widget.selectedOviGender,
      selectedOviDates: widget.selectedOviDates,
      selectedAnimalBreed: widget.selectedAnimalBreed,
      selectedAnimalSpecies: widget.selectedAnimalSpecies,
      selectedAnimalType: widget.selectedAnimalType,
      selectedOviChips: widget.selectedOviChips,
      selectedOviImage: widget.selectedOviImage,
      selectedFilters: widget.selectedFilters,
    );

    setState(() {
      if (OviAnimals.isEmpty) {
        OviAnimals.add(OviDetails);
      } else {
        OviAnimals.insert(0, OviDetails);
      }
    });
  }

  void _filterMammals(String query) {
    setState(() {
      _updateFilteredOviAnimals(query: query);
    });
  }

  void _updateFilteredOviAnimals({String? query}) {}

  void _removeSelectedFilter(String filter) {
    setState(() {
      widget.selectedFilters.remove(filter);
      _updateFilteredOviAnimals(); // Update the filtered list after removing a filter
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // Filter the OviAnimals list based on the filterQuery
    final filteredOviAnimals = OviAnimals.where((animal) {
      final eventNumber = animal.eventNumber.toLowerCase();
      final type = animal.selectedAnimalType.toLowerCase();
      final species = animal.selectedAnimalSpecies.toLowerCase();

      // Add more conditions as needed to match your filtering criteria
      return eventNumber.contains(filterQuery.toLowerCase()) ||
          type.contains(filterQuery.toLowerCase()) ||
          species.contains(filterQuery.toLowerCase());
    }).toList();

    final selectedAnimalImage = ref.watch(selectedAnimalImageProvider);

    void addOviAnimal(String eventNumber) {
      final OviDetails = OviVariables(
        eventNumber: eventNumber,
        selectedOviSire: widget.selectedOviSire,
        selectedOviDam: widget.selectedOviDam,
        species: widget.selectedAnimalSpecies,
        selectedDate: widget.selectedDate,
        fieldName: widget.fieldName,
        fieldContent: widget.fieldContent,
        notes: widget.notesController.text,
        selectedOviGender: widget.selectedOviGender,
        selectedOviDates: widget.selectedOviDates,
        selectedAnimalBreed: widget.selectedAnimalBreed,
        selectedAnimalSpecies: widget.selectedAnimalSpecies,
        selectedAnimalType: widget.selectedAnimalType,
        selectedOviChips: widget.selectedOviChips,
        selectedOviImage: widget.selectedOviImage,
        selectedFilters: widget.selectedFilters,
      );

      setState(() {
        if (OviAnimals.isEmpty) {
          OviAnimals.add(OviDetails);
        } else {
          OviAnimals.insert(0, OviDetails);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'Animals',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAnimalPage(),
                ),
              ).then((_) {
                // When returning from CreateBreedingEvents, add the new event
                if (widget.nameController.text.isNotEmpty) {
                  addOviAnimal(widget.nameController.text);
                }
              });
            }, // Call the addAnimal function when the button is pressed
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(),
                    ),
                    child: TextField(
                      // onChanged: _filterMammals,
                      decoration: InputDecoration(
                        hintText: "Search By Name Or ID",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.filter_alt,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimalFilters(
                                  fieldName: widget.fieldName,
                                  fieldContent: widget.fieldContent,
                                  notesController: widget.notesController,
                                  selectedOviSire: widget.selectedOviSire,
                                  selectedOviDam: widget.selectedOviDam,
                                  selectedOviChips: widget.selectedOviChips,
                                  selectedOviDates: widget.selectedOviDates,
                                  showAdditionalFields:
                                      widget.showAdditionalFields,
                                  selectedOviDateType:
                                      widget.selectedOviDateType,
                                  selectedOviGender: widget.selectedOviGender,
                                  addOviParents: widget.addOviParents,
                                  addOviChildren: widget.addOviChildren,
                                  selectedOviImage: widget.selectedOviImage,
                                  nameController: widget.nameController,
                                  selectedDate: widget.selectedDate,
                                  frequencyEggsController:
                                      widget.frequencyEggsController,
                                  numberofEggsController:
                                      widget.numberofEggsController,
                                  selectedAnimalType: widget.selectedAnimalType,
                                  selectedAnimalSpecies:
                                      widget.selectedAnimalSpecies,
                                  selectedAnimalBreed:
                                      widget.selectedAnimalBreed,
                                  selectedOviDate: null,
                                ),
                              ),
                            );
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.selectedFilters
                .isNotEmpty, // Show space if there are selected filters
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: widget.selectedFilters.map((filter) {
                  return Chip(
                    label: Text(filter),
                    backgroundColor: const Color.fromARGB(
                        255, 228, 228, 228), // Set the background color

                    onDeleted: () {
                      _removeSelectedFilter(filter);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          50), // Adjust the radius as needed
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredOviAnimals.length,
              itemBuilder: (context, index) {
                final OviDetails = filteredOviAnimals[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: selectedAnimalImage != null
                        ? FileImage(selectedAnimalImage)
                        : null,
                    child: selectedAnimalImage == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                  title: Text('${OviDetails.eventNumber}'),
                  subtitle: Text('${widget.selectedAnimalType}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OvigenifnoPage(
                          OviDetails: OviDetails,
                        ),
                      ),
                    );
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
