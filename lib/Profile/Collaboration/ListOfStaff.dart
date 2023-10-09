import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/Profile/Collaboration/StaffDetailsPage.dart';
import 'package:hathera_demo/Widgets/Button.dart';
import 'package:hathera_demo/Widgets/SnackBar.dart';

class ListOfStaff extends StatefulWidget {
  const ListOfStaff({super.key});

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
    await Future.delayed(const Duration(seconds: 2));

    // Update the options list with the fetched data
    List<Map<String, dynamic>> newData = [
      {
        'imagePath':
            'assets/Staff Images/Screenshot_20200303-215853__01.jpg.webp',
        'title': 'Paul Rivera'.tr,
        'subtitle': 'Viewer'.tr,
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath':
            'assets/Staff Images/Black-Widow-Avengers-Endgame-feature.jpg',
        'title': 'Rebecca Wilson'.tr,
        'subtitle': 'Helper'.tr,
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath':
            'assets/Staff Images/Wanda-Dr-Strange-Multiverse-Madness-Culture.jpg.webp',
        'title': 'Patricia Williams'.tr,
        'subtitle': 'Helper'.tr,
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath':
            'assets/Staff Images/HD-wallpaper-thor-in-avengers-endgame.jpg',
        'title': 'Scott Simmons'.tr,
        'subtitle': 'Worker'.tr,
        'email': 'paul@example.com',
        'phoneNumber': '+1 234 567 890',
      },
      {
        'imagePath': 'assets/Staff Images/ed33c7f2a3940fcebf9f0aac54d67895.jpg',
        'title': 'Lee Hall'.tr,
        'subtitle': 'Worker'.tr,
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
                    return SizedBox(
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                'Invite A Member'.tr,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                'Share this link that will provide users access to your farm'
                                    .tr,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
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
                                      const link =
                                          'https://example.com'; // Replace with your link value from the backend
                                      Clipboard.setData(
                                          const ClipboardData(text: link));
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
                              padding: const EdgeInsets.all(16),
                              child: ButtonWidget(
                                onPressed: () {},
                                buttonText: 'Share Link'.tr,
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Your Staff'.tr,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(options[index]['imagePath']),
                  ),
                  title: Text(
                    options[index]['title'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(options[index]['subtitle']),
                  trailing: const Icon(Icons.arrow_forward),
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
