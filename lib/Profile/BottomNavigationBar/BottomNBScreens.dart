import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hathera_demo/AnimalManagement/ListOfAnimals.dart';
import 'package:hathera_demo/HomeScreen/GuestMode/HomeScreen1.dart';
import 'package:hathera_demo/Profile/ProfilePage.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen1(),
    list_of_animals(
      selectedFilters: const [],
    ),
    ProfilePage(),
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
            icon: Icon(Icons.home_outlined),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Animals'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'.tr,
          ),
        ],
      ),
    );
  }
}
