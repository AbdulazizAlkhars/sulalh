import 'package:flutter/material.dart';

class ListOfChildren extends StatefulWidget {
  @override
  State<ListOfChildren> createState() => _ListOfChildrenState();
}

class _ListOfChildrenState extends State<ListOfChildren> {
  final List<Map<String, dynamic>> children = [
    {
      'heading': 'Breeding Event 1',
      'date': '02.09.2023',
      'children': [
        {
          'title': 'Willie',
          'subtitle': 'Male, 0.5 Year',
          'trailing': 'ID #13542',
          'avatarImage': 'assets/avatar1.png',
        },
        {
          'title': 'Nancy',
          'subtitle': 'Female, 1 Year',
          'trailing': 'ID #13542',
          'avatarImage': 'assets/avatar2.png',
        },
        // Add more children for Breeding Event 1 if needed
      ],
    },
    {
      'heading': 'Breeding Event 2',
      'date': '02.09.2023',
      'children': [
        {
          'title': 'Nancy',
          'subtitle': 'Female, 1 Year',
          'trailing': 'ID #13542',
          'avatarImage': 'assets/avatar2.png',
        },
        // Add more children for Breeding Event 2 if needed
      ],
    },
    {
      'heading': 'Breeding Event 3',
      'date': '02.09.2023',
      'children': [
        {
          'title': 'Shirley',
          'subtitle': 'Male, 0.5 Year',
          'trailing': 'ID #13542',
          'avatarImage': 'assets/avatar3.png',
        },
        // Add more children for Breeding Event 3 if needed
      ],
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
              'List Of Children',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: children.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'No Children ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "This Animal Doesn't Have Children",
                        ),
                        Text(
                          "Add Children By Pressing The Button Below ",
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 36, 86, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            // Implement the logic to add children here
                          },
                          child: Text(
                            'Add Children',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) {
                      final breedingEvent = children[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    breedingEvent['heading'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    breedingEvent['date'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: breedingEvent['children'].length,
                            itemBuilder:
                                (BuildContext context, int childIndex) {
                              final child =
                                  breedingEvent['children'][childIndex];

                              return ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0.5,
                                ),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(child['avatarImage']),
                                ),
                                title: Text(child['title']),
                                subtitle: Text(child['subtitle']),
                                trailing: Text(child['trailing']),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
