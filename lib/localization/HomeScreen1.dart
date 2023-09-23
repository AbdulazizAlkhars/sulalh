import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage1 extends StatelessWidget {
  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Hindi', 'locale': Locale('hi', 'IN')},
    {'name': 'Arabic', 'locale': Locale('ar', 'SA')},
  ];

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Choose Language'),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          updatelanguage(locale[index]['locale']);
                        },
                        child: Text(
                          locale[index]['name'],
                          style: TextStyle(fontSize: 18),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow button
        title: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              builddialog(context);
              // Handle notifications button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CardWidget(
                  icon: Icons.book,
                  text: 'SearchAnimals'.tr,
                  buttonText: 'Findanimals'.tr,
                  onPressed: () {
                    // Handle button 1 press
                  },
                  color: Color.fromARGB(
                      255, 197, 219, 158), // Set the color for the first card
                ),
              ),
              Expanded(
                child: CardWidget(
                  icon: Icons.music_note,
                  text: 'SearchFarms'.tr,
                  buttonText: 'Findfarms'.tr,
                  onPressed: () {
                    // Handle button 2 press
                  },
                  color: Color.fromARGB(
                      255, 254, 255, 168), // Set the color for the second card
                ),
              ),
            ],
          ),
          SizedBox(height: 120),
          Text(
            'Wannajoin'.tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(
                  255, 36, 86, 38), // Set the background color of the button
            ),
            onPressed: () {},
            child: Text(
              'Joinnow'.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16), // Set the text color of the button
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Handle text button press
            },
            child: Text(
              'SignIn'.tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;

  const CardWidget({
    required this.icon,
    required this.text,
    required this.buttonText,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: color, // Set the color of the card
        child: Container(
          width: 150,
          height: 220,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.black, // Set the color of the icon
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black), // Set the color of the text
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 36, 86,
                        38), // Set the background color of the button
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color:
                            Colors.white), // Set the text color of the button
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
