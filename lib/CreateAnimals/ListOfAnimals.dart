import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/AnimalManagement/AnimalFilters.dart';
import 'package:hathera_demo/Animal_Information/EditAnimalGenInfo.dart';
import 'package:hathera_demo/Animal_Information/OviparousGeneralInfo.dart';
import 'package:hathera_demo/CreateAnimals/CreateAnimal1.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';

class OviVariables {
  final List<String> selectedFilters;
  late final String eventNumber;
  final String selectedOviSire;
  final String selectedOviDam;
  final String dateOfBirth;
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
  final String layingFrequency;
  final String eggsPerMonth;
  final String selectedBreedingStage;
  final String medicalNeeds;

  final bool shouldAddAnimal;

  OviVariables({
    required this.selectedFilters,
    required this.eventNumber,
    required this.selectedOviSire,
    required this.selectedOviDam,
    required this.dateOfBirth,
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
    required this.layingFrequency,
    required this.eggsPerMonth,
    required this.selectedBreedingStage,
    required this.shouldAddAnimal,
    required this.medicalNeeds,
  });
  OviVariables copyWith({
    List<String>? selectedFilters,
    String? eventNumber,
    String? selectedOviSire,
    String? selectedOviDam,
    String? dateOfBirth,
    String? fieldName,
    String? fieldContent,
    String? notes,
    String? selectedOviGender,
    Map<String, DateTime?>? selectedOviDates,
    String? selectedAnimalBreed,
    String? selectedAnimalSpecies,
    String? selectedAnimalType,
    List<String>? selectedOviChips,
    File? selectedOviImage,
    String? layingFrequency,
    String? eggsPerMonth,
    String? selectedBreedingStage,
    String? medicalNeeds,
    bool? shouldAddAnimal,
  }) {
    return OviVariables(
      selectedFilters: selectedFilters ?? this.selectedFilters,
      eventNumber: eventNumber ?? this.eventNumber,
      selectedOviSire: selectedOviSire ?? this.selectedOviSire,
      selectedOviDam: selectedOviDam ?? this.selectedOviDam,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      fieldName: fieldName ?? this.fieldName,
      fieldContent: fieldContent ?? this.fieldContent,
      notes: notes ?? this.notes,
      selectedOviGender: selectedOviGender ?? this.selectedOviGender,
      selectedOviDates: selectedOviDates ?? this.selectedOviDates,
      selectedAnimalBreed: selectedAnimalBreed ?? this.selectedAnimalBreed,
      selectedAnimalSpecies:
          selectedAnimalSpecies ?? this.selectedAnimalSpecies,
      selectedAnimalType: selectedAnimalType ?? this.selectedAnimalType,
      selectedOviChips: selectedOviChips ?? this.selectedOviChips,
      selectedOviImage: selectedOviImage ?? this.selectedOviImage,
      layingFrequency: layingFrequency ?? this.layingFrequency,
      eggsPerMonth: eggsPerMonth ?? this.eggsPerMonth,
      selectedBreedingStage:
          selectedBreedingStage ?? this.selectedBreedingStage,
      medicalNeeds: medicalNeeds ?? this.medicalNeeds,
      shouldAddAnimal: shouldAddAnimal ?? this.shouldAddAnimal,
    );
  }
}

// ignore: must_be_immutable
class ListOfAnimals extends ConsumerStatefulWidget {
  final bool shouldAddAnimal;

  ListOfAnimals({
    super.key,
    required this.shouldAddAnimal,
  });

  @override
  ConsumerState<ListOfAnimals> createState() => _ListOfAnimals();
}

class _ListOfAnimals extends ConsumerState<ListOfAnimals> {
  String filterQuery = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateFilteredOviAnimals();

    // Add the initial breeding event to the list only if shouldAddAnimal is true
    if (widget.shouldAddAnimal) {
      addOviAnimal(ref.read(animalNameProvider));
    }
  }

  void addOviAnimal(String eventNumber) {
    final OviDetails = OviVariables(
      eventNumber: eventNumber,
      medicalNeeds: ref.read(medicalNeedsProvider),
      shouldAddAnimal: ref.read(shoudlAddAnimalProvider),
      selectedBreedingStage: ref.read(selectedBreedingStageProvider),
      layingFrequency: ref.read(layingFrequencyProvider),
      eggsPerMonth: ref.read(eggsPerMonthProvider),
      selectedOviSire: ref.read(animalSireDetailsProvider),
      selectedOviDam: ref.read(animalDamDetailsProvider),
      dateOfBirth: ref.read(dateOfBirthProvider),
      fieldName: ref.read(fieldNameProvider),
      fieldContent: ref.read(fieldContentProvider),
      notes: ref.read(additionalnotesProvider),
      selectedOviGender: ref.read(selectedOviGenderProvider),
      selectedOviDates: ref.read(selectedOviDatesProvider),
      selectedAnimalBreed: ref.read(selectedAnimalBreedsProvider),
      selectedAnimalSpecies: ref.read(selectedAnimalSpeciesProvider),
      selectedAnimalType: ref.read(selectedAnimalTypeProvider),
      selectedOviChips: ref.read(selectedOviChipsProvider),
      selectedOviImage: ref.read(selectedAnimalImageProvider),
      selectedFilters: ref.read(selectedFiltersProvider),
    );

    setState(() {
      if (ref.read(ovianimalsProvider).isEmpty) {
        ref.read(ovianimalsProvider).add(OviDetails);
      } else {
        ref.read(ovianimalsProvider).insert(0, OviDetails);
      }
    });
  }

  void _filterMammals(String query) {
    setState(() {
      filterQuery = query;
      _updateFilteredOviAnimals(query: query);
    });
  }

  void _updateFilteredOviAnimals({String? query}) {}

  void _removeSelectedFilter(String filter) {
    setState(() {
      ref.read(selectedFiltersProvider).remove(filter);
      _updateFilteredOviAnimals(); // Update the filtered list after removing a filter
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // Filter the OviAnimals list based on the filterQuery
    final selectedFilters = ref.read(selectedFiltersProvider);
    final filteredOviAnimals = ref.read(ovianimalsProvider).where((animal) {
      final eventNumber = animal.eventNumber.toLowerCase();

      final type = animal.selectedAnimalType.toLowerCase();
      final species = animal.selectedAnimalSpecies.toLowerCase();

      // Add more conditions as needed to match your filtering criteria
      return eventNumber.contains(filterQuery.toLowerCase()) ||
          type.contains(filterQuery.toLowerCase()) ||
          species.contains(filterQuery.toLowerCase());
    }).toList();

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
                if (ref.read(animalNameProvider).isNotEmpty) {
                  addOviAnimal(ref.read(animalNameProvider));
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
                      onChanged: _filterMammals,
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
                                builder: (context) => AnimalFilters(),
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
            visible: ref
                .read(selectedFiltersProvider)
                .isNotEmpty, // Show space if there are selected filters
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: ref.read(selectedFiltersProvider).map((filter) {
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
                    backgroundImage: OviDetails.selectedOviImage != null
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
                  title: Text(OviDetails.eventNumber),
                  subtitle: Text(OviDetails.selectedAnimalType),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              editAnimalGenInfo(oviDetails: OviDetails),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: const Color.fromARGB(255, 60, 39, 39),
                    ),
                  ),
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
