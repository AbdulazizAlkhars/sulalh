import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/BreedingEventDetails.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/CreateBreedingEvents.dart';
import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/Riverpod/Globalvariables.dart';

class BreedingEventVariables {
  final String eventNumber;
  final String sire;
  final String dam;
  final String partner;
  final String children;
  final String breedingDate;
  final String deliveryDate;
  final String notes;
  final bool shouldAddEvent;

  BreedingEventVariables({
    required this.eventNumber,
    required this.sire,
    required this.dam,
    required this.partner,
    required this.children,
    required this.breedingDate,
    required this.deliveryDate,
    required this.notes,
    required this.shouldAddEvent,
  });
}

List<BreedingEventVariables> breedingEvents = [];

class ListOfBreedingEvents extends ConsumerStatefulWidget {
  final bool shouldAddBreedEvent;
  // final TextEditingController breedingNotesController;
  // final TextEditingController breedingEventNumberController;
  // final String selectedBreedSire;
  // final String selectedBreedDam;
  // final String selectedBreedPartner;
  // final String selectedBreedChildren;
  // final String selectedBreedingDate;
  // final String selectedDeliveryDate;
  final OviVariables OviDetails;

  ListOfBreedingEvents({
    required this.shouldAddBreedEvent,
    // required this.breedingNotesController,
    // required this.breedingEventNumberController,
    // required this.selectedBreedSire,
    // required this.selectedBreedDam,
    // required this.selectedBreedPartner,
    // required this.selectedBreedChildren,
    // required this.selectedBreedingDate,
    // required this.selectedDeliveryDate,
    required this.OviDetails,
  });

  @override
  _ListOfBreedingEvents createState() => _ListOfBreedingEvents();
}

class _ListOfBreedingEvents extends ConsumerState<ListOfBreedingEvents> {
  String filterQuery = '';
  @override
  void initState() {
    super.initState();
    // Add the initial breeding event to the list
    if (widget.shouldAddBreedEvent) {
      addBreedingEvent(ref.read(breedingEventNumberProvider));
    }
  }

  void addBreedingEvent(String eventNumber) {
    final breedingEvent = BreedingEventVariables(
      eventNumber: eventNumber,
      sire: ref.read(breedingSireDetailsProvider),
      dam: ref.read(breedingDamDetailsProvider),
      partner: ref.read(breedingDamDetailsProvider),
      children: ref.read(breedingDamDetailsProvider),
      breedingDate: ref.read(breedingDamDetailsProvider),
      deliveryDate: ref.read(breedingDamDetailsProvider),
      notes: ref.read(breedingDamDetailsProvider),
      shouldAddEvent: ref.read(shoudlAddEventProvider),
    );

    setState(() {
      if (ref.read(breedingEventsProvider).isEmpty) {
        ref.read(breedingEventsProvider).add(breedingEvent);
      } else {
        ref.read(breedingEventsProvider).insert(0, breedingEvent);
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
  Widget build(BuildContext context) {
    final filteredOvibreedings =
        ref.read(breedingEventsProvider).where((event) {
      final eventNumber = event.eventNumber.toLowerCase();

      final type = event.breedingDate.toLowerCase();
      final species = event.deliveryDate.toLowerCase();

      // Add more conditions as needed to match your filtering criteria
      return eventNumber.contains(filterQuery.toLowerCase()) ||
          type.contains(filterQuery.toLowerCase()) ||
          species.contains(filterQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.OviDetails.animalName,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateBreedingEvents(
                    OviDetails: widget.OviDetails,
                  ),
                ),
              ).then((_) {
                // When returning from CreateBreedingEvents, add the new event
                if (ref.read(breedingEventNumberProvider).isNotEmpty) {
                  addBreedingEvent(ref.read(breedingEventNumberProvider));
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'Breeding History',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredOvibreedings.length,
              itemBuilder: (context, index) {
                final breedingEvent = filteredOvibreedings[index];

                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(breedingEvent.eventNumber),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BreedingEventDetails(
                              breedingEvent:
                                  breedingEvent, // Pass the selected event
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
