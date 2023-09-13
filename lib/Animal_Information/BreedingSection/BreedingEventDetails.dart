// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/BreedingSection/ListOfBreedingEvents.dart';

class BreedingEventDetails extends StatefulWidget {
  final BreedingEventVariables
      breedingEvent; // Event selected in the SecondPage

  const BreedingEventDetails({
    super.key,
    required this.breedingEvent,
  });

  @override
  State<BreedingEventDetails> createState() => _BreedingEventDetailsState();
}

class _BreedingEventDetailsState extends State<BreedingEventDetails> {
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
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Handle back button press
                // Add your code here
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.breedingEvent.eventNumber}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: const [
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
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
                        onPressed: () {},
                        child: Text(
                          '${widget.breedingEvent.sire} (ID Needed)>',
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
                        onPressed: () {},
                        child: Text(
                          '${widget.breedingEvent.dam} (ID Needed)>',
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
                        onPressed: () {},
                        child: Text(
                          ' ${widget.breedingEvent.partner} (ID Needed)>',
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
                      child: Text(
                        'Breeding Date',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '${widget.breedingEvent.breedingDate}',
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
                      child: Text(
                        'Delivery Date',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '${widget.breedingEvent.deliveryDate}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 36, 86, 38),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  "Children",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListTile(
                  onTap: () {
                    // Add your onPressed functionality here
                  },
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 36, 86, 38),
                    child: Text(
                      '${widget.breedingEvent.children}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    '${widget.breedingEvent.children}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Age',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    'ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  "Notes should be parsed",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            // Display the selected event details separately

            Text('Selected Event: ${widget.breedingEvent.eventNumber}'),
            Text('Sire: ${widget.breedingEvent.sire}'),
            Text('Dam: ${widget.breedingEvent.dam}'),
            Text('Partner: ${widget.breedingEvent.partner}'),
            Text('Children: ${widget.breedingEvent.children}'),
            Text('Breeding Date: ${widget.breedingEvent.breedingDate}'),
            Text('Delivery Date: ${widget.breedingEvent.deliveryDate}'),
          ],
        ),
      ),
    );
  }
}
