import 'package:flutter/material.dart';

class ListOfParents extends StatefulWidget {
  final String selectedOviSire;
  final String selectedOviDam;

  const ListOfParents({
    super.key,
    required this.selectedOviSire,
    required this.selectedOviDam,
  });
  @override
  State<ListOfParents> createState() => _ListOfParentsState();
}

class _ListOfParentsState extends State<ListOfParents> {
  final List<Map<String, dynamic>> children = [
    {
      'heading': 'Breeding Event 1',
      'date': '02.09.2023',
      'title': 'Loyce',
      'subtitle': 'Male, 1 Year',
      'trailing': 'ID #13542',
      'avatarImage': 'assets/avatar1.png',
    },
    {
      'heading': 'Breeding Event 2',
      'date': '02.09.2023',
      'title': 'Joyce',
      'subtitle': 'Male, 3 Years',
      'trailing': 'ID #13542',
      'avatarImage': 'assets/avatar2.png',
    },
    {
      'heading': 'Breeding Event 3',
      'date': '02.09.2023',
      'title': 'Angel',
      'subtitle': 'Male, 3.5 Years',
      'trailing': 'ID #13542',
      'avatarImage': 'assets/avatar3.png',
    },
    // Your list of children data goes here
  ];

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
              icon: const Icon(Icons.add),
              onPressed: () {
                // Handle back button press
                // Add your code here
              },
            ),
          ),
        ],
      ),
      body: children.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'No Parents ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "This Animal Doesn't Have Parents.",
                  ),
                  const Text(
                    "Add Parent By Pressing The Button Below.",
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 36, 86, 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      // Implement the logic to add children here
                    },
                    child: const Text(
                      'Add Parents',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Parents',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Sire: ${widget.selectedOviSire}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Details for John Doe',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Dam: ${widget.selectedOviDam}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Details for Jane Smith',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
