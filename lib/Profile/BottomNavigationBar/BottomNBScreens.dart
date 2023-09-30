import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/CreateAnimals/CreateAnimal1.dart';
import 'package:hathera_demo/HomeScreen/Registered/HomePage.dart';
import 'package:hathera_demo/Profile/ProfilePage.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const RegHomePage(),
    const CreateAnimalPage(),
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
