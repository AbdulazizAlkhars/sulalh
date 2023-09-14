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
    // Your list of partners data goes here
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
              'List Of Mates',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: partners.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'No Mates ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "This Animal Hasn't Been Mated Yet",
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
                            'Add Mates',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: partners.length,
                    itemBuilder: (BuildContext context, int index) {
                      final partner = partners[index];

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
                                    partner['heading'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    partner['date'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.5,
                                vertical: 0.5,
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(partner['avatarImage']),
                              ),
                              title: Text(partner['title']),
                              subtitle: Text(partner['subtitle']),
                              trailing: Text(partner['trailing']),
                            ),
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
