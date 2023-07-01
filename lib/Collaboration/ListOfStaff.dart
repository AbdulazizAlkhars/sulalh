import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hathera_demo/Collaboration/StaffDetailsPage.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/SnackBar.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                'Invite A Member',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                'Share this link that will provide users access to your farm',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextFormField(
                                    initialValue:
                                        'https://example.com', // Replace with your link value from the backend
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 12),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final link =
                                          'https://example.com'; // Replace with your link value from the backend
                                      Clipboard.setData(
                                          ClipboardData(text: link));
                                      CustomSnackBar.show(
                                          context, 'Link Copied To Clipboard');

                                      Navigator.pop(
                                          context); // Navigate back to the previous screen
                                    },
                                    child: const Text(
                                      'Copy Link',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 36, 86, 38),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: ButtonWidget(
                                onPressed: () {},
                                buttonText: 'Share Link',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
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
