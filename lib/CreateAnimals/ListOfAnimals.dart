import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/AnimalManagement/AnimalFilters.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/BreedingEventDetails.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';
import 'package:hathera_demo/Animal_Information/EditAnimalGenInfo.dart';
import 'package:hathera_demo/Animal_Information/EnlargedAnimalPic.dart';
import 'package:hathera_demo/Animal_Information/OviparousGeneralInfo.dart';
import 'package:hathera_demo/CreateAnimals/CreateAnimal1.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';
import 'package:hathera_demo/Theme/Colors.dart';
import 'package:hathera_demo/Theme/Fonts.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/dummylist.dart';

class OviVariables {
  final List<String> selectedFilters;
  late final String animalName;
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
  final String breedingeventNumber;
  final String breedsire;
  final String breeddam;
  final String breedpartner;
  final String breedchildren;
  final String breedingDate;
  final String breeddeliveryDate;
  final String breedingnotes;
  final bool shouldAddEvent;
  final BreedingDetails breedingDetails;
  final Map<String, List<BreedingEventVariables>> breedingEvents;
  final Map<String, List<VaccineDetails>> vaccineDetails;

  OviVariables(
      {required this.selectedFilters,
      required this.animalName,
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
      required this.breedingeventNumber,
      required this.breedsire,
      required this.breeddam,
      required this.breedpartner,
      required this.breedchildren,
      required this.breedingDate,
      required this.breeddeliveryDate,
      required this.breedingnotes,
      required this.shouldAddEvent,
      required this.breedingDetails,
      required this.breedingEvents,
      required this.vaccineDetails});
  OviVariables copyWith(
      {List<String>? selectedFilters,
      String? animalName,
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
      String? breedingeventNumber,
      String? breedsire,
      String? breeddam,
      String? breedpartner,
      String? breedchildren,
      String? breedingDate,
      String? breeddeliveryDate,
      String? breedingnotes,
      bool? shouldAddEvent,
      Map<String, List<BreedingEventVariables>>? breedingEvents,
      final Map<String, List<VaccineDetails>>? vaccineDetails,
      String? BreedingDetails}) {
    return OviVariables(
        selectedFilters: selectedFilters ?? this.selectedFilters,
        animalName: animalName ?? this.animalName,
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
        breedingeventNumber: breedingeventNumber ?? this.breedingeventNumber,
        breedsire: breedsire ?? this.breedsire,
        breeddam: breeddam ?? this.breeddam,
        breedchildren: breedchildren ?? this.breedchildren,
        breedingDate: breedingDate ?? this.breedingDate,
        breeddeliveryDate: breeddeliveryDate ?? this.breeddeliveryDate,
        breedingnotes: breedingnotes ?? this.breedingnotes,
        breedpartner: breedpartner ?? this.breedpartner,
        shouldAddEvent: shouldAddEvent ?? this.shouldAddEvent,
        breedingDetails: breedingDetails,
        breedingEvents: breedingEvents ?? this.breedingEvents,
        vaccineDetails: vaccineDetails ?? this.vaccineDetails);
  }
}

class BreedingDetails {
  final String breedsire;
  final String breeddam;
  final String breedpartner;
  final String breedchildren;
  final String breedingDate;
  final String breeddeliveryDate;
  final String breedingnotes;
  final bool shouldAddEvent;

  BreedingDetails({
    required this.breedsire,
    required this.breeddam,
    required this.breedpartner,
    required this.breedchildren,
    required this.breedingDate,
    required this.breeddeliveryDate,
    required this.breedingnotes,
    required this.shouldAddEvent,
  });
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
  Future<void> _refreshOviAnimals() async {
    // Add your logic to refresh the list here
    // For example, you can fetch new data or update existing data
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay

    // Call _updateFilteredOviAnimals to apply filters on the refreshed list
    _updateFilteredOviAnimals(query: filterQuery);
  }

  @override
  void initState() {
    super.initState();
    _updateFilteredOviAnimals();

    // Add the initial breeding event to the list only if shouldAddAnimal is true
    if (widget.shouldAddAnimal) {
      addOviAnimal(
        ref.read(animalNameProvider),
        ref.read(breedingEventNumberProvider),
      );
    }
  }

  void addOviAnimal(String animalName, String breedingeventNumber) {
    final breedingDetails = BreedingDetails(
      breedsire: ref.read(breedingSireDetailsProvider),
      breeddam: ref.read(breedingDamDetailsProvider),
      breedpartner: ref.read(breedingDamDetailsProvider),
      breedchildren: ref.read(breedingChildrenDetailsProvider),
      breedingDate: ref.read(breedingDateProvider),
      breeddeliveryDate: ref.read(deliveryDateProvider),
      breedingnotes: ref.read(breedingnotesProvider),
      shouldAddEvent: ref.read(shoudlAddEventProvider),
    );
    final OviDetails = OviVariables(
      animalName: animalName,
      breedingeventNumber: breedingeventNumber,
      breedingDetails: breedingDetails,
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
      breedsire: ref.read(breedingSireDetailsProvider),
      breeddam: ref.read(breedingDamDetailsProvider),
      breedpartner: ref.read(breedingDamDetailsProvider),
      breedchildren: ref.read(breedingChildrenDetailsProvider),
      breedingDate: ref.read(breedingDateProvider),
      breeddeliveryDate: ref.read(deliveryDateProvider),
      breedingnotes: ref.read(breedingnotesProvider),
      shouldAddEvent: ref.read(shoudlAddEventProvider),
      breedingEvents: {animalName: []},
      vaccineDetails: {animalName: []},
    );

    setState(() {
      if (ref.read(ovianimalsProvider).isEmpty) {
        ref.read(ovianimalsProvider).add(OviDetails);
      } else {
        ref.read(ovianimalsProvider).insert(0, OviDetails);
      }
      // ignore: unused_result
      ref.refresh(mammalCountProvider);
      // ignore: unused_result
      ref.refresh(oviparousCountProvider);
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
    final filteredOviAnimals = ref.read(ovianimalsProvider).where((animal) {
      final eventNumber = animal.animalName.toLowerCase();

      final type = animal.selectedAnimalType.toLowerCase();
      final species = animal.selectedAnimalSpecies.toLowerCase();

      // Add more conditions as needed to match your filtering criteria
      return eventNumber.contains(filterQuery.toLowerCase()) ||
          type.contains(filterQuery.toLowerCase()) ||
          species.contains(filterQuery.toLowerCase());
    }).toList();
    return RefreshIndicator(
      onRefresh: _refreshOviAnimals,
      color: AppColors.primary40,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Animals'.tr,
            style: AppFonts.title3(color: AppColors.grayscale90),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary50,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              onPressed: () {
                ref
                    .read(selectedAnimalTypeProvider.notifier)
                    .update((state) => '');
                ref
                    .read(selectedAnimalSpeciesProvider.notifier)
                    .update((state) => '');
                ref
                    .read(selectedAnimalBreedsProvider.notifier)
                    .update((state) => '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateAnimalPage(),
                  ),
                ).then((_) {
                  // When returning from CreateBreedingEvents, add the new event
                  if (ref.read(animalNameProvider).isNotEmpty) {
                    addOviAnimal(
                      ref.read(animalNameProvider),
                      ref.read(breedingEventNumberProvider),
                    );
                  }
                });
              }, // Call the addAnimal function when the button is pressed
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.029,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                            hintText: "Search By Name Or ID".tr,
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
                visible: ref.read(selectedFiltersProvider).isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.02,
                    children: ref.read(selectedFiltersProvider).map((filter) {
                      return Chip(
                        deleteIcon: Icon(
                          Icons.close_rounded,
                          color: AppColors.grayscale90,
                          size: MediaQuery.of(context).size.width * 0.05,
                        ),
                        label: Text(filter),
                        labelStyle:
                            AppFonts.body2(color: AppColors.grayscale90),
                        backgroundColor: AppColors.grayscale10,
                        onDeleted: () {
                          _removeSelectedFilter(filter);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              filteredOviAnimals.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredOviAnimals.length,
                        itemBuilder: (context, index) {
                          // ignore: non_constant_identifier_names
                          final OviDetails = filteredOviAnimals[index];
                          return Dismissible(
                              key:
                                  UniqueKey(), // Provide a unique key for each item
                              direction: DismissDirection
                                  .endToStart, // Enable swipe from right to left
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                color: Colors
                                    .red, // Background color for delete action
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (direction) {
                                // Handle item dismissal here
                                setState(() {
                                  final removedAnimal =
                                      filteredOviAnimals.removeAt(index);
                                  ref
                                      .read(ovianimalsProvider)
                                      .remove(removedAnimal);
                                  // You may want to update your data source (e.g., ovianimalsProvider) here too
                                });
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.all(7),
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EnlargedAnimalImageScreen(
                                          image: OviDetails.selectedOviImage,
                                        ),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.064,
                                    backgroundColor: Colors.grey[100],
                                    backgroundImage:
                                        OviDetails.selectedOviImage != null
                                            ? FileImage(
                                                OviDetails.selectedOviImage!)
                                            : null,
                                    child: OviDetails.selectedOviImage == null
                                        ? const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 50,
                                            color: Colors.grey,
                                          )
                                        : null,
                                  ),
                                ),
                                title: Text(OviDetails.animalName),
                                subtitle: Text(OviDetails.selectedAnimalType),
                                trailing: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditAnimalGenInfo(
                                            OviDetails: OviDetails),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit_note_outlined,
                                    size: 30,
                                    color: AppColors.primary40,
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
                              ));
                        },
                      ),
                    )
                  : SingleChildScrollView(
                      child: Center(
                        heightFactor: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/illustrations/cow_search.png',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text(
                              'No Animals Found',
                              style: AppFonts.headline3(
                                  color: AppColors.grayscale90),
                            ),
                            Text(
                              'Try adjusting the filters',
                              style:
                                  AppFonts.body2(color: AppColors.grayscale70),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
