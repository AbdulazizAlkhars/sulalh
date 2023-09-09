// ignore: file_names
import 'package:flutter/material.dart';

import 'package:hathera_demo/HomeScreen/GuestMode/AnimalInfo.dart';

class HouseFarmPage extends StatefulWidget {
  const HouseFarmPage({super.key});

  @override
  State<HouseFarmPage> createState() => _HouseFarmPageState();
}

class _HouseFarmPageState extends State<HouseFarmPage> {
  final List<Map<String, dynamic>> mammals = [
    {
      'name': 'Lion',
      'image': 'assets/images/lion.jpg',
      'subtitle': 'The King of the Jungle',
    },
    {
      'name': 'Elephant',
      'image': 'assets/images/elephant.jpg',
      'subtitle': 'The Majestic Creature',
    },
    {
      'name': 'Giraffe',
      'image': 'assets/images/giraffe.jpg',
      'subtitle': 'The Tall Wonder',
    },
    {
      'name': 'Tiger',
      'image': 'assets/images/tiger.jpg',
      'subtitle': 'The Fierce Predator',
    },
    {
      'name': 'Panda',
      'image': 'assets/images/panda.jpg',
      'subtitle': 'The Adorable Bamboo Eater',
    },
    {
      'name': 'Lion',
      'image': 'assets/images/lion.jpg',
      'subtitle': 'The King of the Jungle',
    },
    {
      'name': 'Elephant',
      'image': 'assets/images/elephant.jpg',
      'subtitle': 'The Majestic Creature',
    },
    {
      'name': 'Giraffe',
      'image': 'assets/images/giraffe.jpg',
      'subtitle': 'The Tall Wonder',
    },
    {
      'name': 'Tiger',
      'image': 'assets/images/tiger.jpg',
      'subtitle': 'The Fierce Predator',
    },
    {
      'name': 'Panda',
      'image': 'assets/images/panda.jpg',
      'subtitle': 'The Adorable Bamboo Eater',
    },
  ];

  List<Map<String, dynamic>> _filteredMammals = [];

  @override
  void initState() {
    super.initState();
    _filteredMammals = mammals;
  }

  void _filterMammals(String query) {
    setState(() {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'House Farm',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.filter_alt,
                            size: 30,
                          ),
                          onPressed: () {},
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
