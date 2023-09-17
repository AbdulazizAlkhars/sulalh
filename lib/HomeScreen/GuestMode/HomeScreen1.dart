import 'package:flutter/material.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/SearchFarms&Animals.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/StartUrFarm.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final GlobalKey _one = GlobalKey();

  final GlobalKey _two = GlobalKey();

  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four]));
  }

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
                child: Showcase(
                  targetBorderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  key: _one,
                  description:
                      'Here You Can Find Information About Animals & Breeds',
                  child: CardWidget(
                    icon: Icons.book,
                    text: 'Searching For Animals',
                    buttonText: 'Find Animals',
                    onPressed: () {
                      // Handle button 1 press
                    },
                    color: const Color.fromARGB(
                        255, 197, 219, 158), // Set the color for the first card
                  ),
                ),
              ),
              Expanded(
                child: Showcase(
                  targetBorderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  key: _two,
                  description:
                      "Here You Can Find Another Person's Farm, View Information About It & Join It After Registration.",
                  child: CardWidget(
                    icon: Icons.music_note,
                    text: 'Search For\nFarms',
                    buttonText: 'Find Farms',
                    onPressed: () {
                      // Handle button 2 press
                    },
                    color: const Color.fromARGB(255, 254, 255,
                        168), // Set the color for the second card
                  ),
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
          Showcase(
            key: _three,
            description: 'Join The Farms',
            targetBorderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: ElevatedButton(
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
          ),
          const SizedBox(height: 20),
          Showcase(
            key: _four,
            description: 'Sign In By Clicking This',
            child: TextButton(
              onPressed: () {
                // Handle text button press
              },
              child: const Text(
                'Sign In',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    super.key,
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
          padding: const EdgeInsets.all(16),
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
