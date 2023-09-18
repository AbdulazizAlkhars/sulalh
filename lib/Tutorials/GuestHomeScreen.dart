import 'package:flutter/material.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/HomeScreen1.dart';
import 'package:hathera_demo/Tutorials/RegHomeScreenTutorial.dart';

import 'package:showcaseview/showcaseview.dart';

class GuestHomeScreenTutorial extends StatefulWidget {
  const GuestHomeScreenTutorial({super.key});

  @override
  State<GuestHomeScreenTutorial> createState() => _GuestHomeScreenTutorial();
}

class _GuestHomeScreenTutorial extends State<GuestHomeScreenTutorial> {
  final GlobalKey _findAnimals = GlobalKey();
  final GlobalKey _findFarms = GlobalKey();
  final GlobalKey _joinNow = GlobalKey();
  final GlobalKey _signIn = GlobalKey();
  final GlobalKey _next1 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase(
            [_findAnimals, _findFarms, _joinNow, _signIn, _next1]));
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
            onPressed: () {},
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
                  key: _findAnimals,
                  tooltipBackgroundColor: const Color.fromARGB(
                      255, 197, 219, 158), // Set the color for the first card,
                  descTextStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
                  key: _findFarms,
                  tooltipBackgroundColor:
                      const Color.fromARGB(255, 254, 255, 168),
                  description:
                      "Here You Can Find Another Person's Farm, View Information About It & Join It After Registration.",
                  descTextStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
            key: _joinNow,
            description: 'Join The Farms',
            tooltipBackgroundColor: const Color.fromARGB(255, 36, 86, 38),
            descTextStyle: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            targetPadding: const EdgeInsets.all(5),
            targetBorderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 36, 86, 38), // Set the background color of the button
              ),
              onPressed: () {},
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
            key: _signIn,
            description: 'Sign In By Clicking This',
            descTextStyle: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 36, 86, 38),
                fontWeight: FontWeight.bold),
            child: TextButton(
              onPressed: () {
                // Handle text button press
              },
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 36, 86, 38),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Showcase(
        key: _next1,
        targetPadding: EdgeInsets.all(5),
        targetBorderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        description: 'Click Here To Go To Next Page Tutorial',
        descTextStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 36, 86, 38),
            fontWeight: FontWeight.bold),
        onTargetClick: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  const RegHomeScreenTutorial(), // Replace with your desired page.
            ),
          );
        },
        disposeOnTap: true,
        child: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      const RegHomeScreenTutorial(), // Replace with your desired page.
                ),
              );
            },
            backgroundColor: const Color.fromARGB(255, 36, 86, 38),
            elevation: 10,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.arrow_right_alt,
              size: 44,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
