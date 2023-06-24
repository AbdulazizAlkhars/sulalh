import 'package:flutter/material.dart';
import 'package:hathera_demo/Collaboration/StaffDetailsPage.dart';

class ListOfStaff extends StatefulWidget {
  @override
  State<ListOfStaff> createState() => _ListOfStaffState();
}

class _ListOfStaffState extends State<ListOfStaff> {
  List<Map<String, dynamic>> options = [];

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
      // Add more data as needed
    ];

    setState(() {
      options = newData;
    });
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
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Your Staff',
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(options[index]['imagePath']),
                  ),
                  title: Text(
                    options[index]['title'],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(options[index]['subtitle']),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaffDetailsPage(
                          imagePath: options[index]['imagePath'],
                          title: options[index]['title'],
                          subtitle: options[index]['subtitle'],
                          email: options[index]['email'],
                          phoneNumber: options[index]['phoneNumber'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 40),
            // Rest of your code...
          ],
        ),
      ),
    );
  }
}
