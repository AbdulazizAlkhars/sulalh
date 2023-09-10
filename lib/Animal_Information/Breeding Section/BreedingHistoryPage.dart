import 'package:flutter/material.dart';
import 'package:hathera_demo/Animal_Information/Breeding%20Section/CreateBreedingEvents.dart';
import 'package:hathera_demo/CreateAnimals/SelectedOptions.dart';

class BreedingHistoryPage extends StatefulWidget {
  const BreedingHistoryPage({Key? key}) : super(key: key);

  @override
  _BreedingHistoryPageState createState() => _BreedingHistoryPageState();
}

class _BreedingHistoryPageState extends State<BreedingHistoryPage> {
  // Define a list of breeding history items
  List<String> breedingHistoryItems = [
    'Breeding History Item 1',
    'Breeding History Item 2',
    'Breeding History Item 3',
    // Add more items as needed
  ];

  // Define sublists for each breeding history item
  List<List<String>> sublists = [
    ['Subitem 1-1', 'Subitem 1-2', 'Subitem 1-3'],
    ['Subitem 2-1', 'Subitem 2-2'],
    ['Subitem 3-1', 'Subitem 3-2', 'Subitem 3-3', 'Subitem 3-4'],
    // Add more sublists as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Stesha',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
            // Add your code here
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
                          )));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Breeding History',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Create a dynamic list of breeding history items
              ListView.builder(
                shrinkWrap: true,
                itemCount: breedingHistoryItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(breedingHistoryItems[index]),
                        // Add more ListTile customization here if needed
                      ),
                      // Create a dynamic sublist of items for each breeding history item
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: sublists[index].length,
                        itemBuilder: (BuildContext context, int subIndex) {
                          return ListTile(
                            title: Text(sublists[index][subIndex]),
                            // Add more ListTile customization here if needed
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
