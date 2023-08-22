import 'package:flutter/material.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/SearchFarmDetails.dart';

import 'SearchAnimalDetails.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> farms = [
    {
      'imagePath':
          'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
      'title': 'Paul Rivera',
      'subtitle': 'Farmer Name',
      'email': 'paul@example.com',
      'phoneNumber': '+1 234 567 890',
    },
    {
      'imagePath':
          'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
      'title': 'Rebecca Wilson',
      'subtitle': 'Farmer Name',
      'email': 'paul@example.com',
      'phoneNumber': '+1 234 567 890',
    },
    {
      'imagePath':
          'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
      'title': 'Patricia Williams',
      'subtitle': 'Farmer Name',
      'email': 'paul@example.com',
      'phoneNumber': '+1 234 567 890',
    },
    {
      'imagePath':
          'assets/Staff Images/HD-wallpaper-thor-in-avengers-endgame.jpg',
      'title': 'Scott Simmons',
      'subtitle': 'Farmer Name',
      'email': 'paul@example.com',
      'phoneNumber': '+1 234 567 890',
    },
    {
      'imagePath': 'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg',
      'title': 'Lee Hall',
      'subtitle': 'Farmer Name',
      'email': 'paul@example.com',
      'phoneNumber': '+1 234 567 890',
    },
    // Add more data here if needed
  ];
  List<Map<String, dynamic>> animals = [
    {
      'imagePath':
          'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
      'title': 'Horse',
      'geninfo':
          'The horse is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, close to Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BC'
    },
    {
      'imagePath':
          'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
      'title': 'Cow',
      'geninfo':
          'The cow is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, close to Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BC'
    },
    {
      'imagePath':
          'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
      'title': 'Ox',
      'geninfo':
          'The ox is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, close to Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BC'
    },
    {
      'imagePath':
          'assets/Staff Images/HD-wallpaper-thor-in-avengers-endgame.jpg',
      'title': 'Sheep',
      'geninfo':
          'The sheep is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, close to Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BC'
    },
    {
      'imagePath': 'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg',
      'title': 'Bull',
      'geninfo':
          'The bull is a domesticated, one-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, close to Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BCE, and their domestication is believed to have been widespread by 3000 BC'
    },
    // Add more data here if needed
  ];
  List<Map<String, dynamic>> filteredOptions = [];
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredAnimals = [];

  @override
  void initState() {
    super.initState();
    filteredOptions = farms;
    filteredAnimals = animals;
    // Initialize filteredOptions with all options
  }

  void filterOptions(String searchText) {
    setState(() {
      filteredOptions = farms
          .where((option) =>
              option['title'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      filteredAnimals = animals
          .where((option) =>
              option['title'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void navigateToSearchFarmDetailsPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchFarmDetails(
          imagePath: option['imagePath'],
          title: option['title'],
          subtitle: option['subtitle'],
          email: option['email'],
          phoneNumber: option['phoneNumber'],
        ),
      ),
    );
  }

  void navigateToSearchAnimalDetailsPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchAnimalDetails(
          imagePath: option['imagePath'],
          title: option['title'],
          geninfo: option['geninfo'],
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      controller: _searchController,
                      onChanged: filterOptions,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    filterOptions('');
                  },
                ),
              ],
            ),
          ),
          if (filteredOptions.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredOptions.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Farms',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  } else {
                    final option = filteredOptions[index - 1];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(option['imagePath']),
                        ),
                        title: Text(
                          option['title'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(option['subtitle']),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          navigateToSearchFarmDetailsPage(option);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          if (filteredAnimals.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredAnimals.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: Text(
                        'Animals',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  } else {
                    final option = filteredAnimals[index - 1];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(option['imagePath']),
                        ),
                        title: Text(
                          option['title'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          navigateToSearchAnimalDetailsPage(option);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
