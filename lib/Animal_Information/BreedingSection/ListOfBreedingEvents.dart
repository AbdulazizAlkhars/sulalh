import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/BreedingEventDetails.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/CreateBreedingEvents.dart';

class BreedingEventVariables {
  final String eventNumber;
  final String sire;
  final String dam;
  final String partner;
  final String children;
  final String breedingDate;
  final String deliveryDate;
  final String notes;

  BreedingEventVariables({
    required this.eventNumber,
    required this.sire,
    required this.dam,
    required this.partner,
    required this.children,
    required this.breedingDate,
    required this.deliveryDate,
    required this.notes,
  });
}

List<BreedingEventVariables> breedingEvents = [];

class ListOfBreedingEvents extends StatefulWidget {
  final TextEditingController breedingNotesController;
  final TextEditingController breedingEventNumberController;
  final String selectedBreedSire;
  final String selectedBreedDam;
  final String selectedBreedPartner;
  final String selectedBreedChildren;
  final String selectedBreedingDate;
  final String selectedDeliveryDate;

  ListOfBreedingEvents({
    required this.breedingNotesController,
    required this.breedingEventNumberController,
    required this.selectedBreedSire,
    required this.selectedBreedDam,
    required this.selectedBreedPartner,
    required this.selectedBreedChildren,
    required this.selectedBreedingDate,
    required this.selectedDeliveryDate,
  });

  @override
  _ListOfBreedingEvents createState() => _ListOfBreedingEvents();
}

class _ListOfBreedingEvents extends State<ListOfBreedingEvents> {
  @override
  void initState() {
    super.initState();
    // Add the initial breeding event to the list
    if (widget.breedingEventNumberController.text.isNotEmpty) {
      addBreedingEvent(widget.breedingEventNumberController.text);
    }
  }

  void addBreedingEvent(String eventNumber) {
    final breedingEvent = BreedingEventVariables(
      eventNumber: eventNumber,
      sire: widget.selectedBreedSire,
      dam: widget.selectedBreedDam,
      partner: widget.selectedBreedPartner,
      children: widget.selectedBreedChildren,
      breedingDate: widget.selectedBreedingDate,
      deliveryDate: widget.selectedDeliveryDate,
      notes: widget.breedingNotesController.text,
    );

    setState(() {
      breedingEvents.insert(0, breedingEvent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Harry',
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
                    selectedAnimalType: '',
                    selectedAnimalSpecies: '',
                    selectedAnimalBreed: '',
                  ),
                ),
              ).then((_) {
                // When returning from CreateBreedingEvents, add the new event
                if (widget.breedingEventNumberController.text.isNotEmpty) {
                  addBreedingEvent(widget.breedingEventNumberController.text);
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
              itemCount: breedingEvents.length,
              itemBuilder: (context, index) {
                final breedingEvent = breedingEvents[index];

                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('${breedingEvent.eventNumber}'),
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
