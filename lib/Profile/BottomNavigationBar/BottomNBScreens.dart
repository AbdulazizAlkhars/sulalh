import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hathera_demo/CreateAnimals/ListOfAnimals.dart';
import 'package:hathera_demo/HomeScreen/Registered/HomePage.dart';
import 'package:hathera_demo/Profile/ProfilePage.dart';

class bottomNavigationBarPage extends StatefulWidget {
  const bottomNavigationBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  bottomNavigationBarPageState createState() => bottomNavigationBarPageState();
}

class bottomNavigationBarPageState extends State<bottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const RegHomePage(),
    ListOfAnimals(
      shouldAddAnimal: false,
    ),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.pets),
            label: 'Animals'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile'.tr,
          ),
        ],
      ),
    );
  }
}
