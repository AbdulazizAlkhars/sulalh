import 'package:flutter/material.dart';
import 'package:hathera_demo/Collaboration/StaffDetailsPage.dart';
import 'package:hathera_demo/HomePage/SearchFarm&AnimalDetails.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> allOptions = [];
  List<Map<String, dynamic>> filteredOptions = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend(); // Fetch initial data from the backend
  }

  Future<void> fetchDataFromBackend() async {
    // Simulate fetching data from the backend
    await Future.delayed(Duration(seconds: 2));

    // Update the options list with the fetched data
    List<Map<String, dynamic>> newData = [
      {
        'imagePath':
            'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
        'title': 'Paul Rivera',
        'subtitle': 'Viewer',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath':
            'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
        'title': 'Rebecca Wilson',
        'subtitle': 'Helper',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath':
            'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
        'title': 'Patricia Williams',
        'subtitle': 'Helper',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath':
            'assets/Staff Images/HD-wallpaper-thor-in-avengers-endgame.jpg',
        'title': 'Scott Simmons',
        'subtitle': 'Worker',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath': 'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg',
        'title': 'Lee Hall',
        'subtitle': 'Worker',
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      // Your data here
    ];

    setState(() {
      allOptions = newData;
      filteredOptions = newData;
    });
  }

  void filterOptions(String searchText) {
    setState(() {
      filteredOptions = allOptions
          .where((option) =>
              option['title'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void navigateToDetailsPage(Map<String, dynamic> option) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchDetails(
          imagePath: option['imagePath'],
          title: option['title'],
          subtitle: option['subtitle'],
          email: option['email'],
          phoneNumber: option['phoneNumber'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredOptions.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                    child: Text(
                      'Farms',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  final option = filteredOptions[index - 1];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(option['imagePath']),
                    ),
                    title: Text(
                      option['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(option['subtitle']),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      navigateToDetailsPage(option);
                    },
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
