import 'package:flutter/material.dart';

class ListOfPartners extends StatefulWidget {
  @override
  State<ListOfPartners> createState() => _ListOfPartnersState();
}

class _ListOfPartnersState extends State<ListOfPartners> {
  final List<Map<String, dynamic>> partners = [
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
  ];

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'List Of Mates',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Add a heading above each list tile
          for (var item in partners)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          item['heading'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text(
                          item['date'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.5),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(item['avatarImage']),
                    ),
                    title: Text(item['title']),
                    subtitle: Text(item['subtitle']),
                    trailing: Text(item['trailing']),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
