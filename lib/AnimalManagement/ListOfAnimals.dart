import 'package:flutter/material.dart';
import 'package:hathera_demo/AnimalManagement/AnimalFilters.dart';
import 'package:hathera_demo/CreateAnimals/CreateAnimal1.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/AnimalInfo.dart';

// ignore: camel_case_types
class list_of_animals extends StatefulWidget {
  final List<String> selectedFilters;

  const list_of_animals({super.key, required this.selectedFilters});

  @override
  State<list_of_animals> createState() => _list_of_animals();
}

// ignore: camel_case_types
class _list_of_animals extends State<list_of_animals> {
  final List<Map<String, dynamic>> mammals = [
    {
      'name': 'Kenneth',
      'image': 'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
      'subtitle': 'Oviparous',
    },
    {
      'name': 'Beverly',
      'image': 'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
      'subtitle': 'Mammal',
    },
    {
      'name': 'John',
      'image':
          'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Patrick',
      'image': 'assets/Staff Images/HD-wallpaper-thor-in-avengers-endgame.jpg',
      'subtitle': 'Oviparous',
    },
    {
      'name': 'Brian',
      'image': 'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Joyce',
      'image':
          'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
      'subtitle': 'Mammal',
    },
  ];

  List<Map<String, dynamic>> _filteredMammals = [];

  @override
  void initState() {
    super.initState();
    _updateFilteredMammals();
  }

  void _filterMammals(String query) {
    setState(() {
      _updateFilteredMammals(query: query);
    });
  }

  void _updateFilteredMammals({String? query}) {
    _filteredMammals = mammals.where((mammal) {
      final name = mammal['name'].toString().toLowerCase();
      final subtitle = mammal['subtitle'].toString().toLowerCase();
      return (query == null ||
              query.isEmpty ||
              name.contains(query.toLowerCase()) ||
              subtitle.contains(query.toLowerCase())) &&
          (widget.selectedFilters.isEmpty ||
              widget.selectedFilters.contains(mammal['subtitle']));
    }).toList();
  }

  void _removeSelectedFilter(String filter) {
    setState(() {
      widget.selectedFilters.remove(filter);
      _updateFilteredMammals(); // Update the filtered list after removing a filter
    });
  }

  void navigateToAnimalInfo(Map<String, dynamic> mammal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimalInfo(
          image: mammal['image'],
          name: mammal['name'],
          subtitle: mammal['subtitle'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAnimalPage()),
              );
            },
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
                                  builder: (context) => const AnimalFilters()),
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
              itemCount: _filteredMammals.length,
              itemBuilder: (context, index) {
                final mammal = _filteredMammals[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(mammal['image']),
                  ),
                  title: Text(mammal['name']),
                  subtitle: Text(mammal['subtitle']),
                  onTap: () {
                    navigateToAnimalInfo(mammal);
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
