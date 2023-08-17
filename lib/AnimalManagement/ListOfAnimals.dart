import 'package:flutter/material.dart';
import 'package:hathera_demo/AnimalManagement/AnimalFilters.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/AnimalInfo.dart';
import 'package:hathera_demo/Widgets/Button.dart';

class ListOfAnimals extends StatefulWidget {
  @override
  State<ListOfAnimals> createState() => _ListOfAnimals();
}

class _ListOfAnimals extends State<ListOfAnimals> {
  final List<Map<String, dynamic>> mammals = [
    {
      'name': 'Kenneth',
      'image': 'assets/images/lion.jpg',
      'subtitle': 'Oviparous',
    },
    {
      'name': 'Beverly',
      'image': 'assets/images/elephant.jpg',
      'subtitle': 'Mammal',
    },
    {
      'name': 'John',
      'image': 'assets/images/giraffe.jpg',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Patrick',
      'image': 'assets/images/tiger.jpg',
      'subtitle': 'Oviparous',
    },
    {
      'name': 'Brian',
      'image': 'assets/images/panda.jpg',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Joyce',
      'image': 'assets/images/lion.jpg',
      'subtitle': 'Mammal',
    },
    {
      'name': 'Billy',
      'image': 'assets/images/elephant.jpg',
      'subtitle': 'Mammal',
    },
  ];

  String _searchQuery = '';
  List<Map<String, dynamic>> _filteredMammals = [];

  @override
  void initState() {
    super.initState();
    _filteredMammals = mammals;
  }

  void _filterMammals(String query) {
    setState(() {
      _searchQuery = query;
      _filteredMammals = mammals.where((mammal) {
        final name = mammal['name'].toString().toLowerCase();
        final subtitle = mammal['subtitle'].toString().toLowerCase();
        return name.contains(query.toLowerCase()) ||
            subtitle.contains(query.toLowerCase());
      }).toList();
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
        title: Text(
          'Animals',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
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
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.filter_alt,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimalFilters()),
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
