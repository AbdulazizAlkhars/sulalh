import 'package:flutter/material.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/SearchFarms&Animals.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/StartUrFarm.dart';
import 'package:hathera_demo/signup/Signup_With_Phone.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow button
        title: const Text(
          'Welcome',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CardWidget(
                  imagePath: 'assets/icons/frame/24px/Cow_Icon.png',
                  text: 'Searching For Animals',
                  buttonText: 'Find Animals',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()),
                    );
                  },
                  color: const Color.fromARGB(
                      255, 197, 219, 158), // Set the color for the first card
                ),
              ),
              Expanded(
                child: CardWidget(
                  imagePath: 'assets/icons/frame/24px/Farm_house.png',
                  text: 'Search For\nFarms',
                  buttonText: 'Find Farms',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()),
                    );
                  },
                  color: const Color.fromARGB(
                      255, 254, 255, 168), // Set the color for the second card
                ),
              ),
            ],
          ),
          const SizedBox(height: 120),
          const Text(
            'Want To Start Your Farm\n Right Now & Join',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 36, 86, 38), // Set the background color of the button
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StartUrFarm()),
              );
            },
            child: const Text(
              'Join Now',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16), // Set the text color of the button
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhnSignupPage()),
              );
            },
            child: const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String imagePath; // Image path for Image.asset
  final String text;
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;

  const CardWidget({
    super.key,
    required this.imagePath,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imagePath, // Use Image.asset with the specified image path
                width: 40, // Set the width of the image
                height: 40, // Set the height of the image
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black), // Set the color of the text
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 36, 86,
                        38), // Set the background color of the button
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: const TextStyle(
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
