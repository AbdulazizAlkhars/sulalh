import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/Breeding%20Section/CreateBreedingEvents.dart';

class BreedingEvent {
  final String eventNumber;
  final String sire;
  final String dam;
  final String partner;
  final String children;
  final String breedingDate;
  final String deliveryDate;

  BreedingEvent({
    required this.eventNumber,
    required this.sire,
    required this.dam,
    required this.partner,
    required this.children,
    required this.breedingDate,
    required this.deliveryDate,
  });
}

List<BreedingEvent> breedingEvents = [];

class SecondPage extends StatefulWidget {
  final TextEditingController breedingNotesController;
  final TextEditingController breedingEventNumberController;
  final String selectedBreedSire;
  final String selectedBreedDam;
  final String selectedBreedPartner;
  final String selectedBreedChildren;
  final String selectedBreedingDate;
  final String selectedDeliveryDate;

  SecondPage({
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
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    // Add the initial breeding event to the list
    if (widget.breedingEventNumberController.text.isNotEmpty) {
      addBreedingEvent(widget.breedingEventNumberController.text);
    }
  }

  void addBreedingEvent(String eventNumber) {
    final breedingEvent = BreedingEvent(
      eventNumber: eventNumber,
      sire: widget.selectedBreedSire,
      dam: widget.selectedBreedDam,
      partner: widget.selectedBreedPartner,
      children: widget.selectedBreedChildren,
      breedingDate: widget.selectedBreedingDate,
      deliveryDate: widget.selectedDeliveryDate,
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
                      title: Text('Event ${breedingEvent.eventNumber}'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ThirdPage(
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

class ThirdPage extends StatelessWidget {
  final BreedingEvent breedingEvent; // Event selected in the SecondPage

  ThirdPage({
    required this.breedingEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breeding Event Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'Breeding Event Details',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // Display the selected event details separately
          Text('Selected Event: ${breedingEvent.eventNumber}'),
          Text('Sire: ${breedingEvent.sire}'),
          Text('Dam: ${breedingEvent.dam}'),
          Text('Partner: ${breedingEvent.partner}'),
          Text('Children: ${breedingEvent.children}'),
          Text('Breeding Date: ${breedingEvent.breedingDate}'),
          Text('Delivery Date: ${breedingEvent.deliveryDate}'),
        ],
      ),
    );
  }
}
